Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISCLOUD_URL'] }

  config.on(:startup) do
    if File.exist?(File.expand_path('config/schedule.yml', Rails.root))
      schedule_file = File.expand_path('config/schedule.yml', Rails.root)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISCLOUD_URL'] }
end
