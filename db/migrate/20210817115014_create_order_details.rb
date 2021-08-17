class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :amount, null: false
      t.integer :tax_included_price, null: false
      t.integer :production_status, null: false, default: 0
      t.integer :item_id, foreign_key: true
      t.integer :order_id, foreign_key: true
      t.timestamps
    end
  end
end
