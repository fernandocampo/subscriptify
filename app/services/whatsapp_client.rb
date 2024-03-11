require "httparty"
require "logger"
require "json"

TOKEN = "EAAT0mMpmDusBOzZAunXIpRAMkxNAZA3ZBH0MuartTGvVRijGHZCXZCxEXOXXAWamrQAe2MXZBMamZBhePYYhJb8lcCyQI8JLnjUm2qbKLuH4YSCu0aAKEEeGcZBE2yvIL3O54Bhzt3MJxZBnxUrZAJXbK9ZCTtnO985qSX30pQQ4IMylQHEKm75uv5LwJ5UimE4BFvDfVO9QkDmRjBpuLmQKj1fikR7bWkZD"
SENDER_ID = "277091525477286"
BUSINESS_ID = "277756515412427"
RECIPIENT_ID = "+5491137632285"
BASE_URL = "https://graph.facebook.com/v18.0/" + SENDER_ID + "/messages"

LOG = Logger.new(STDOUT)

class WhatsAppClient
  include HTTParty

  def inintialize

    data = {

        "messaging_product": "whatsapp",
        "recipient_type": "individual",
        "to": RECIPIENT_ID,
        "type": "text",
        "text": {
            "preview_url": false,
            "body": "Primer mensaje desde Ruby"
        }

    }
    response = self.class.post(BASE_URL,
      body: (data),
      headers: {
            "Content-type" => "application/json"
            "Autorization" => "Bearer #{TOKEN}"
      }

    )

    @response_body = JSON.parse(response.body)

    LOG.info "#{@response_body}"* if @response_body["error"]

    @contacts = @response_body["contacts"]
    @messages = @response_body["messages"]


  end

  def details
    {
        contacts: @contacts
        messages: @messages
    }

  end
end

whatsapp = WhatsAppClient.new

p whatsapp.details
