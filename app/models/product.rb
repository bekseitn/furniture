class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items

  default_scope { where(active: true) }
end
