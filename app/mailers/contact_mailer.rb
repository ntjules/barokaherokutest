class ContactMailer < ApplicationMailer
  def contact_mail(startup)
    @startup = startup
    mail to: @startup.user.email, subject: 'you have published your startup on bishop'
 end
end
