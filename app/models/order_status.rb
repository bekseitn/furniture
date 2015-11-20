class OrderStatus < ActiveRecord::Base
  has_many :orderings
end
