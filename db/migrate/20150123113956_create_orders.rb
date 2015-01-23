class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :credit_card
      t.integer :exp_month
      t.integer :exp_year
      t.integer :cc

      t.timestamps null: false
    end
  end
end
