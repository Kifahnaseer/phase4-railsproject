class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.float :amount, null: false
      t.string :payment_method
      t.string :card_number
      t.string :cardholder_name
      t.string :expiration_date
      t.string :cvc

      t.timestamps
    end
  end
end
