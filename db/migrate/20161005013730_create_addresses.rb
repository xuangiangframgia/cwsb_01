class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :details, null: false
      t.references :county, index: true ,foreign_key: true
      t.belongs_to :venue, index: true

      t.timestamps
    end
  end
end
