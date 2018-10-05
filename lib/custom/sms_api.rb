require 'open-uri'

class SMSApi

  attr_accessor :client

  def initialize
    @client = Savon.client(wsdl: wsdl_path, log: true)
  end

  def wsdl_path
    Rails.root.join('config', 'sms_wsdl.xml')
  end

  def sms_deliver(phone, code)
    Rails.logger.info("Verification code: #{code}") if Rails.env.development?

    response_body = if end_point_available?
                      client.call(
                        :sms_text_submit,
                        message: build_message(phone, code)
                      ).body
                    else
                      stubbed_response_body
                    end

    success?(response_body)
  end

  def build_message(phone, code)
    {
      'Version' => '1.0',
      'Authorization' => authorization,
      'Sender' => sender_phone,
      'Recipients' => { 'To' => [phone] },
      'SMSText' => "Clave para verificarte: #{code}. Gobierno Abierto",
      'SMSClass' => '1'
    }
  end

  def end_point_available?
    Rails.env.staging? || Rails.env.preproduction? || Rails.env.production?
  end

  private

  def success?(response_body)
    response_body.dig(:submit_res, :status, :status_text) == 'Success'
  end

  def authorization
    Base64.strict_encode64("#{service_user}:#{service_password}")
  end

  def service_user
    Rails.application.secrets.sms_username
  end

  def service_password
    Rails.application.secrets.sms_password
  end

  def sender_phone
    Rails.application.secrets.sms_sender_phone
  end

  def stubbed_response_body
    {
      submit_res: {
        version: '1.0',
        status: {
          status_code: '1000',
          status_text: 'Success',
          details: 'Request processed succesfully'
        },
        message_id: 'example-123',
        '@xmlns:ns1': 'http://www.example.com/schemas'
      }
    }
  end

end
