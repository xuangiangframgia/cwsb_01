class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status, default: 1
      t.float :total_paid
      t.references :venue
      t.boolean :is_ready, default: true

      t.timestamps
    end
  end
end
