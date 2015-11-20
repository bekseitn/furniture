class Ordering < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :order
  belongs_to :city
  has_many :order_items
  before_create :set_order_params
  after_create :set_order_items

  validates :city, :name, :address, :phone, presence: true

private

  def set_order_items
    order.order_items.update_all(ordering_id: id, order_id: nil)
  end

  def set_order_params
    self.total = order.total
    self.order_status_id = 1
  end  

end
