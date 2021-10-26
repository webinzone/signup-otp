class ApplicationJob < ActiveJob::Base
	lass SendVerificationCodeJob < ActiveJob::Base
  queue_as :default

  def perform(user)
		  # generate verification code

		  user.verification_code =  100_000 + rand(1_000_000 - 100_000)

		  user.save
		  to = user.mobile_number
		  if to[0] = "0"
		    to.sub!("0", '+44')
		  end

		  # twilio send 
		  @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']

		  @twilio_client.account.sms.messages.create(
		    :from => ENV['TWILIO_PHONE_NUMBER'],
		    :to => to,
		    :body => "Your verification code is #{user.verification_code}."
		  )
		end
	end
end
