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

  def notification_helper
    @user = params[:user]
    # Corrected logic to filter subscriptions based on a condition (e.g., day_number equals user's my_today)
    filtered_subscriptions = @user.subscriptions.select { |sub| sub.day_number == @user.my_today }

    filtered_subscriptions.each do |subscription|
      subscription_reminder(subscription.id)
    end
  end
end
