class CreatePocketCashes < ActiveRecord::Migration
  def change
    create_table :pocket_cashes do |t|
      t.date :produced_date
      t.float :total_price

      t.timestamps null: false
    end
  end
end
