class CreatePocketItems < ActiveRecord::Migration
  def change
    create_table :pocket_items do |t|
      t.integer :pocket_cash_id
      t.date :item_date
      t.string :subject
      t.string :description
      t.string :item_type 
      t.float :price
      t.string :summons_number
      t.string :note
      t.string :project_code

      t.timestamps null: false
    end
  end
end
