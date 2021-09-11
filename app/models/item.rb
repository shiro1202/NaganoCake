class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attachment :image


  def tax_included_price
    (no_tax_price * 1.1).round
  end

end
