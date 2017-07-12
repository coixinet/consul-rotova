require "uri"
require "net/http"
require "json"

class SMSApi

  def sms_deliver(phone, code)
    return true unless end_point_available?

    request = Net::HTTP::Post.new(request_url)
    request["content-type"] = "application/json"
    request["accept"] = "application/json"
    request.body = request_body(phone, code)

    response = http_client.request(request)
    response.read_body
    return true
  end

  private

  def request_body(to, code)
    {
      api_key: Rails.application.secrets.sms_password,
      concat: 1,
      messages: [
        {
          from: "Gob.Abierto",
          to: to,
          text: "Clave para verificarte: #{code}. Gobierno Abierto"
        }
      ]
    }.to_json
  end

  def http_client
    @http_client ||= setup_http_client
  end

  def request_url
    @request_url ||= URI(Rails.application.secrets.sms_end_point)
  end

  def setup_http_client
    http_client = Net::HTTP.new(request_url.host, request_url.port)
    http_client.use_ssl = true
    http_client.verify_mode = OpenSSL::SSL::VERIFY_NONE

    http_client
  end

  def end_point_available?
    Rails.env.staging? || Rails.env.preproduction? || Rails.env.production?
  end

end
