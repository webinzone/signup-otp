class ApplicationController < ActionController::Base
	SendVerificationCodeJob.perform_later(user)
end
