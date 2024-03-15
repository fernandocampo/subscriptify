class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :subscriptions, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def due_dates
    subscriptions.map{ |subscription| subscription.payment_date.day }
  end

  def mailing_dates
    due_dates.map{ |date| date - 1 }
  end

  def my_today
    Date.today.day
  end
end
