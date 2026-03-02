class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_token

  def daily_notifications
    EmailerJob.new.perform
    head :ok
  end

  private

  def verify_token
    token = request.headers["X-Webhook-Token"]
    head :unauthorized unless ActiveSupport::SecurityUtils.secure_compare(
      token.to_s,
      ENV.fetch("WEBHOOK_SECRET", "")
    )
  end
end
