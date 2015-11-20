class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items, dependent: :destroy
  default_scope { where(active: true) }
  mount_uploader :picture, PictureUploader

  filterrific(
    available_filters: [
      :search_query,
      :with_price_gte,
      :with_price_lt      
    ]
  )  

  scope :with_price_gte, lambda { |price|
    where('products.price >= ?', price)
  }

  scope :with_price_lt, lambda { |price|
    where('products.price <= ?', price)
  }

  scope :search_query, lambda { |query|
    return nil  if query.blank?

    terms = query.downcase.split(/\s+/)

    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 2

    where(
      terms.map { |term|
        "(LOWER(products.name) LIKE ? OR LOWER(categories.name) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }  

end
