require 'twilio-ruby'

class TextMessage

   def self.send(number, city, start_date, name)
      account_sid = 'AC554ac98c7c138bdff979db865e60d125'
      auth_token = '39b15464a6c26800003b5972fe3898e3'
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.messages.create(
      from: '+441202286016',
      to:   number, #phone number to send to
      body: "Hello #{name}, your reservation in #{city} for #{start_date} has been confirmed."
      )
      message_text = "Hello #{name}, your reservation in #{city} for #{start_date} has been confirmed."
    end
end
