class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    all_subscriptions = current_user.subscriptions.to_a
    @analytics = SubscriptionAnalytics.new(all_subscriptions)
    @monthly_total = @analytics.monthly_burn_rate
    @next_subscription = all_subscriptions.min_by(&:payment_date)

    @subscriptions = current_user.subscriptions
    if params[:query].present?
      @subscriptions = @subscriptions.where("company_name ILIKE :query", query: "%#{params[:query]}%")
    end
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    prepend_protocol_to_url(@subscription)
    if @subscription.save
      redirect_to subscriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    prepend_protocol_to_url(@subscription)
    if @subscription.update(subscription_params)
      redirect_to subscriptions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
    redirect_to subscriptions_path
  end

  def export
    @subscriptions = current_user.subscriptions
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=\"subscriptions.xlsx\""
      }
    end
  end


  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(
      :company_name,
      :description,
      :recurrent,
      :frequency,
      :payment_date,
      :url,
      :price, :currency,
      :category, :photo
    )
  end

  def prepend_protocol_to_url(subscription)
    unless subscription.url =~ /\Ahttp[s]?:\/\//
      subscription.url.prepend("http://")
    end
  end
end
