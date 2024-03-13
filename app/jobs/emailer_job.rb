class EmailerJob
  include Sidekiq::Job

  def perform
    User.find_each do |user|
      UserMailer.with(user: user).notification_helper.deliver_later
    end
  end
end
