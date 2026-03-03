class ChangeSubscriptionPriceToDecimal < ActiveRecord::Migration[8.1]
  def up
    execute "ALTER TABLE subscriptions ALTER COLUMN price TYPE numeric(10,2) USING price::numeric"
  end

  def down
    execute "ALTER TABLE subscriptions ALTER COLUMN price TYPE double precision USING price::double precision"
  end
end
