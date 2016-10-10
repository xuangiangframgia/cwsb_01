class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :phone_number
      t.boolean :verified
      t.boolean :active
      t.integer :role

      t.timestamps
    end
  end
end
