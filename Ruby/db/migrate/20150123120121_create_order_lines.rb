class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :count
      t.integer :size

      t.timestamps null: false
    end
  end
end
