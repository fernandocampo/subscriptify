class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = Subscription.all
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.save!
  end

  def edit
  end

  def update
    if @subscription.update(subscription_params)
      redirect_to subscription_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
    redirect_to subscriptions_path
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
      :category
    )
  end
end
