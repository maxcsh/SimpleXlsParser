class AddCompanyPhoneToCustomer < ActiveRecord::Migration
  def change
    add_column :customers , :company_phone1 , :string
    add_column :customers , :company_phone2 , :string
    add_column :customers , :company_phone3 , :string
  end
end
