class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_details
  accepts_nested_attributes_for :order_details

  enum payment_method: [:credit_card, :transfer]
  enum status: [:waiting, :confirmation, :production, :ready_to_ship, :shipped]
end
