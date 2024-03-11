class UserMailer < ApplicationMailer
  default from: 'Notificacion <contact@subscriptify.me>' # this domain must be verified with Resend
  def welcome_email
    @user = params[:user]
    @url = 'https://www.subscriptify.me'
    mail(to: ["darioferreira10@gmail.com"], subject: 'hello world')
  end

  def subscription_reminder(subscription_id)
    @user = params[:user]
    @subscription = Subscription.find(subscription_id)
    @url = 'https://www.subscriptify.me'
    mail(to: [@user.email], subject: "Recordatorio de #{@subscription.company_name}")
    # mail(to: [@user.email], subject: "Recordatorio de #{@subscription.company_name}")
  end
end
