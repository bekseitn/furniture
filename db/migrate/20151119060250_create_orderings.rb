class CreateOrderings < ActiveRecord::Migration
  def change
    create_table :orderings do |t|
      t.references :city, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :order_status, index: true, foreign_key: true
      t.string :address
      t.string :name
      t.string :phone           
      t.integer :total

      t.timestamps null: false
    end
  end
end
