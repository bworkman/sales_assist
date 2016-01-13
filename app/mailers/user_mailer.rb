class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    mail(to: user.email, 
         from: "webmaster@example.com", 
         subject: "Thank you for Registering")
  end
  
end
