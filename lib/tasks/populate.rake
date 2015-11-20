namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'faker'
    require 'populator'    

    Product.populate 100 do |product|
      product.name = Faker::Commerce.product_name
      product.price = Faker::Commerce.price
      product.category_id = Category.order("RANDOM()").first
      product.active = true
    end
    
  end
end