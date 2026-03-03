class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def profile
    @user = current_user
  end

  def notification_helper
    User.find_each do |user|
      UserMailer.with(user: user).notification_helper.deliver_later
    end
    redirect_to profile_path, notice: "Notificacion enviada correctamente."
  end
end
