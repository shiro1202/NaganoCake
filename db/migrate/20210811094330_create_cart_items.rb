class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :amount, null: false
      t.integer :end_user_id, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.timestamps
    end
  end
end
