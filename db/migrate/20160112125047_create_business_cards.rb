class CreateBusinessCards < ActiveRecord::Migration
  def change
    create_table :business_cards do |t|
      t.string :category_number
      t.string :category
      t.string :company_name
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

      t.timestamps null: false
    end
  end
end

#公司名稱 姓名 職稱 電話  傳真  手機  地址  電子信箱  統編  收到備註  建檔
