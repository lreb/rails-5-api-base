class UserMailer < ApplicationMailer
	def registration_confirmation(user)
    @user = user
    @url  = # generate confirmation url
    mail(to: @user.email, subject: "Welcome!")
  end
end
