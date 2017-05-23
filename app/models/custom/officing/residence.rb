require_dependency Rails.root.join('app', 'models', 'officing', 'residence').to_s

class Officing::Residence
  private

    def call_census_api
      date_of_birth = Date.new(year_of_birth.to_i) if year_of_birth.present?
      @census_api_response = CensusApi.new.call(document_type, document_number, date_of_birth)
    end

    def residency_valid?
      @census_api_response && @census_api_response.valid?
    end

    def census_year_of_birth
      @census_api_response.date_of_birth.year
    end
end
