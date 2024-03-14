class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def show
    @user = current_user
  end

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
