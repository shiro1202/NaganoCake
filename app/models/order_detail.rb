class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: [:cant_start, :waiting_for_production, :producing, :finished]
end
