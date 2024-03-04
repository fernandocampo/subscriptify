class Subscription < ApplicationRecord
  belongs_to :user

  FREQUENCE = ["weekly", "monthly", "anually"]

  CATEGORIES = ["education", "streaming", "services"]

  CURRENCIES = ["usd", "ars", "clp"]

  validates :frequency, inclusion: { in: FREQUENCE }
  validates :category, inclusion: { in: CATEGORIES }
  validates :currency, inclusion: { in: CURRENCIES }
end
