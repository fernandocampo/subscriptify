class EmailerJob
  def perform
    User.find_each do |user|
      UserMailer.with(user: user).notification_helper.deliver_now
    end
  end
end
