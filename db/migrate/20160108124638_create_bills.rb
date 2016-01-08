class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :company_number
      t.string :vat_number
      t.string :company_name
      t.string :company_address
      t.string :company_phone
      t.float :pre_paid
      t.float :to_be_paid
      t.float :total_price
      t.float :tax
      t.float :tax_price


      t.timestamps null: false
    end
  end
end
