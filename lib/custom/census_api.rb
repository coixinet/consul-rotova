include DocumentParser
class CensusApi

  def call(document_type, document_number, date_of_birth)
    return Response.new("False", nil) unless date_of_birth.present?
    date_of_birth = date_of_birth.to_date.to_s(:db)

    response = nil

    get_document_number_variants(document_type, document_number).each do |variant|
      body = get_response_body(document_type, variant, date_of_birth)
      response = Response.new(body, date_of_birth)
      return response if response.valid?
    end

    response
  end

  class Response
    attr_accessor :date_of_birth, :postal_code, :district_code, :gender, :name

    def initialize(body, date_of_birth)
      @body = body
      @date_of_birth = Date.parse(date_of_birth) if date_of_birth
    end

    def valid?
      @body == "True"
    end
  end

  private

    def get_response_body(document_type, document_number, date_of_birth)
      return stubbed_response(document_type, document_number) unless end_point_available?

      begin
        token = get_token
        request(token, document_type, document_number, date_of_birth)
      rescue
        "False"
      end
    end

    def get_token
      conn = Faraday.new(:url => Rails.application.secrets.census_api_token["host"])
      r = conn.post(Rails.application.secrets.census_api_token["path"], Rails.application.secrets.census_api_token["params"])
      JSON.parse(r.body)["access_token"]
    end

    def request(token, document_type, document_number, date_of_birth)
      conn = Faraday.new(Rails.application.secrets.census_api_end_point,
        headers: { "Authorization" => "Bearer #{token}" },
        params: {
          "filtros[0].Nombre" => "NumDocumento",
          "filtros[0].Valor" => document_number,
          "filtros[1].Nombre" => "TipoDocumento",
          "filtros[1].Valor" => document_type,
          "filtros[2].Nombre" => "FechaNacimiento",
          "filtros[2].Valor" => date_of_birth,
        }
      )
      r = conn.get
      body = r.body
      response_body = case body
                      when "\"True\""
                        "True"
                      when "\"False\""
                        "False"
                      else
                        JSON.parse(r.body)
                      end
      response_body
    end

    def is_dni?(document_type)
      document_type.to_s == "1"
    end

    def end_point_available?
      Rails.env.staging? || Rails.env.preproduction? || Rails.env.production?
    end

    def stubbed_response(document_type, document_number)
      if document_number == "12345678Z" && document_type == "1"
        stubbed_valid_response
      else
        stubbed_invalid_response
      end
    end

    def stubbed_valid_response
      "True"
    end

    def stubbed_invalid_response
      "False"
    end
end
