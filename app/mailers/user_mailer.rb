class UserMailer < ApplicationMailer
  def registration_confirmation(user)
    mail(to: user.email, 
         from: "webmaster@example.com", 
         subject: "Thank you for Registering",
         body: :user => user)
  end
  
end
