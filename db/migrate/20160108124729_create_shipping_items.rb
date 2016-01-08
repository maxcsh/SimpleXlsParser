class CreateShippingItems < ActiveRecord::Migration
  def change
    create_table :shipping_items do |t|
      t.integer :shipping_list_id
      t.string :item_name
      t.string :spec
      t.float :amount
      t.string :unit
      t.float :unit_price
      t.float :sum_price

      t.timestamps null: false
    end
  end
end
