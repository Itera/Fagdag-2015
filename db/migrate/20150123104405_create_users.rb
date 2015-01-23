class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pw_hash
      t.string :address

      t.timestamps null: false
    end
  end
end
