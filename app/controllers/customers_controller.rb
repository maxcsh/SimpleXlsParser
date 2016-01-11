class CustomersController < ApplicationController

  before_action :find_customer , :only => [ :show , :edit , :update , :destroy ]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    if Customer.create( customer_params )
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update( customer_params )
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end


  private

  def find_customer
    @customer = Customer.find( params[:id] )
  end

  def customer_params
    params.require( :customer ).permit( :number , :company_name , :agent , :contact_1 , :contact_phone_1 , :contact_mobile_1 , :contact_email_1 , :contact_2 , :contact_phone_2 , :contact_mobile_2 , :contact_email_2 , :contact_3 , :contact_phone_3 , :contact_mobile_3 , :contact_email_3 , :address , :vat_number , :fax , :signed_date , :branch_company , :company_title , :note , :company_phone1 , :company_phone2 , :company_phone3 )
  end
end
