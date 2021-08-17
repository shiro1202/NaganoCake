class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :shipping_cost, null: false
      t.integer :total_payment, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :end_user_id, foreign_key: true
      t.timestamps
    end
  end
end
