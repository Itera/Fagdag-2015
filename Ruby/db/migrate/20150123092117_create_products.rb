class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :brand
      t.string :description
      t.string :color
      t.string :image
      t.decimal :price
      t.integer :size_min
      t.integer :size_max

      t.timestamps null: false
    end
  end
end
