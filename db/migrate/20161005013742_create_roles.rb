class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :type, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
