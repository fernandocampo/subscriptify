class Subscription < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  FREQUENCE = ["Monthly", "Anually"]

  CATEGORIES = ["Education", "Streaming", "Entertainment", "Services"]

  CURRENCIES = ["USD", "ARS", "CLP"]

  validates :frequency, inclusion: { in: FREQUENCE }
  validates :category, inclusion: { in: CATEGORIES }
  validates :currency, inclusion: { in: CURRENCIES }

  validates :company_name, presence: true
  validates :frequency, presence: true
  validates :payment_date, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true

  def day_number
    payment_date.day - 1
  end
end
