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
end
