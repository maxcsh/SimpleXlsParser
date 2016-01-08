class CreateShippingLists < ActiveRecord::Migration
  def change
    create_table :shipping_lists do |t|
      t.integer :bill_id
      t.string :list_number
      t.float :total_price
      t.float :tax_price
      t.string :note

      t.timestamps null: false
    end
  end
end
