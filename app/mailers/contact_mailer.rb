class ContactMailer < ApplicationMailer
  def contact_mail(startup)
    @startup = startup
    mail to: "birotori@gmailcom", subject: "vous avez publier votre startup sur bishop"
 end
end
