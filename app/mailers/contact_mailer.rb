class ContactMailer < ApplicationMailer
  def contact_mail(params, contact, current_user)
    @contact = contact
    mail(to: contact.email,
         from: current_user.email,
         subject: params[:subject],
         body: params[:body])
  end
  
end
