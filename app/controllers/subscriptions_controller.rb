class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy], except: [:index, :new, :create, :export, :stats]

  def index
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

  def export
    @subscriptions = current_user.subscriptions
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename=\"subscriptions.xlsx\""
      }
    end
  end

  def export_pdf
    @subscriptions = current_user.subscriptions
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Subscriptions",
               template: "subscriptions/export_pdf",
               formats: [:html],
               layout: 'export_pdf' # Aquí se corrige el nombre del layout
      end
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



  def calculate_expenses
    @upcoming_expenses = current_user.subscriptions.group_by_month(:payment_date, format: "%B").sum(:price)
    @average_expenses_by_category = current_user.subscriptions.group(:category).average(:price)
    @current_month_expenses_by_category = current_user.subscriptions.where(payment_date: Date.today.beginning_of_month..Date.today.end_of_month).group(:category).sum(:price)
  end

end
