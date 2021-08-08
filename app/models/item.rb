class Item < ApplicationRecord
  belongs_to :genre
  attachment :image

  def tax_included_price
    (no_tax_price * 1.1).round
  end

end
