class AddBillColumns < ActiveRecord::Migration
  def change
    add_column :bills , :past_payable , :float
    add_column :bills , :has_paid , :float
    add_column :bills , :should_be_paid , :float
    add_column :bills , :allowance , :float
  end
end
