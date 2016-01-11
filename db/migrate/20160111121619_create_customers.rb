class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer  :number
      t.string   :company_name
      t.string   :agent
      t.string   :contact_1
      t.string   :contact_phone_1
      t.string   :contact_mobile_1
      t.string   :contact_email_1
      t.string   :contact_2
      t.string   :contact_phone_2
      t.string   :contact_mobile_2
      t.string   :contact_email_2
      t.string   :contact_3
      t.string   :contact_phone_3
      t.string   :contact_mobile_3
      t.string   :contact_email_3
      t.string   :address
      t.string   :vat_number
      t.string   :fax
      t.date     :signed_date
      t.string   :branch_company
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :company_title
      t.text     :note

      t.timestamps null: false
    end
  end
end
