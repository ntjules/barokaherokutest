class DeleteMailer < ApplicationMailer
  def delete_mail(startup)
    @startup = startup
    mail to: "birotori@gmailcom", subject: "vous avez suprimer votre startup sur bishop"
 end
end
