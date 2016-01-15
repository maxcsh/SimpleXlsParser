class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :category_number
      t.string :category
      t.string :company_number
      t.string :company_name
      t.string :company_brief_name
      t.string :name
      t.string :title
      t.string :phone
      t.string :tax_phone
      t.string :mobile_phone
      t.string :address
      t.string :email
      t.string :vat_number
      t.string :note
      t.string :old_created_at
      t.string :contact

      t.timestamps null: false
    end
  end
end
#廠商編號 company_number
#廠商簡稱 company_brief_name
#公司地址 address
#電話     phone   
#統一編號 vat_number
#聯 絡 人 contact
