class NotificationsMailer < ActionMailer::Base
  default :from => "natasha@adcomdesigns.com"
  default :to => "natasha@adcomdesigns.com"

  def new_message(message)
    @message = message
    mail(:subject => "AdCom contact form")
  end
end
