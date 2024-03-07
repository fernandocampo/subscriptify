class Subscription < ApplicationRecord
  belongs_to :user

  FREQUENCE = ["weekly", "monthly", "anually"]

  CATEGORIES = ["education", "streaming", "services"]

  CURRENCIES = ["usd", "ars", "clp"]

  validates :frequency, inclusion: { in: FREQUENCE }
  validates :category, inclusion: { in: CATEGORIES }
  validates :currency, inclusion: { in: CURRENCIES }

  validates :company_name, presence: true
  validates :frequency, presence: true
  validates :payment_date, presence: true
  validates :category, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true
end

