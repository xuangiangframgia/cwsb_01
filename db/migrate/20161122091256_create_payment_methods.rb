class CreatePaymentMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.boolean :status
      t.string :email
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
