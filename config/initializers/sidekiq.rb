require 'sidekiq/cron/job'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    if File.exist?(File.expand_path('config/schedule.yml', Rails.root))
      schedule_file = File.expand_path('config/schedule.yml', Rails.root)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end
