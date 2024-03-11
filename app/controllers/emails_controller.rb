class EmailsController < ApplicationController
  def send_email
    @email = Email.new(params[:email])

    if @email.valid?
      Resend.send_email(
        from: 'your_email@example.com',
        to: @email.to,
        subject: @email.subject,
        body: @email.body
      )

      flash[:notice] = 'Email enviado correctamente.'
      redirect_to root_path
    else
      render :custom_email
    end
  end

  def custom_email
    @email = Email.new
  end

  #
  payment_date = @subscription.payment_date

  def date_match?(payment_date)
    payment_date = Date.parse(payment_date)
    today = Date.today
    payment_date == today
  end
end


  def subscription_email(user, subscription)
  UserMailer.subscription_reminder(user: user, subscription_id: subscription.id).deliver_now
end

# if date_match?(payment_date)
#   subscription_email
# end
