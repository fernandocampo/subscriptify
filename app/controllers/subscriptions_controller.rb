class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  def index
    @subscriptions = current_user.subscriptions
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    if @subscription.save
      redirect_to subscription_path(@subscription)
    else
      render :new, status: :unprocessable_entity
    end
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

  def stats
    calculate_expenses
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

  def calculate_expenses
    @upcoming_expenses = current_user.subscriptions.group_by_month(:payment_date, format: "%B").sum(:price)
    @average_expenses_by_category = current_user.subscriptions.group(:category).average(:price)
    @current_month_expenses_by_category = current_user.subscriptions.where(payment_date: Date.today.beginning_of_month..Date.today.end_of_month).group(:category).sum(:price)
  end

end
