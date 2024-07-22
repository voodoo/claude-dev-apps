require 'sinatra'
require 'twilio-ruby'

# Twilio account credentials
account_sid  = 'YOUR_ACCOUNT_SID'
auth_token   = 'YOUR_AUTH_TOKEN'
twilio_phone = ''
# Initialize Twilio client
client = Twilio::REST::Client.new(account_sid, auth_token)

get '/' do
  'Welcome to your Twilio app!'
end

post '/send_sms' do
  to = params['to']
  body = params['body']

  message = client.messages.create(
    body: body,
    from: 'twilio_phone',
    to: to
  )

  "Message sent with SID: #{message.sid}"
end