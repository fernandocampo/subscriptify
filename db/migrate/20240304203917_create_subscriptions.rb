class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :company_name
      t.string :description
      t.boolean :recurrent
      t.string :frequency
      t.date :payment_date
      t.string :url
      t.float :price
      t.string :currency
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
