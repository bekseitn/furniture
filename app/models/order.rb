class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  before_save :update_total

  def total
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def update_total
    self[:total] = total
  end
end