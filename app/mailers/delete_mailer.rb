class DeleteMailer < ApplicationMailer
  def delete_mail(startup)
    @startup = startup
    mail to: @startup.user.email, subject: 'you have deleted your startup on bishop'
 end
end
