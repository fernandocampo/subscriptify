# Soporta REDIS_URL (Render) y REDISCLOUD_URL (Heroku) para compatibilidad
redis_url = ENV["REDIS_URL"] || ENV["REDISCLOUD_URL"]

if redis_url
  Sidekiq.configure_server do |config|
    config.redis = { url: redis_url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: redis_url }
  end
end
