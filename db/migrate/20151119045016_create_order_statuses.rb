class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :name
    end
  end
end
