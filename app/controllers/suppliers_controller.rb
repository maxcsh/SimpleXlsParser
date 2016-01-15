class SuppliersController < ApplicationController

  before_action :find_supplier , :only => [ :show , :edit , :update , :destroy ]

  def index
    @suppliers = Supplier.all
  end

  def show    
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new( supplier_params )
    if @supplier.save
      redirect_to supplier_path( @supplier )
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @supplier.update( supplier_params )
      redirect_to supplier_path( @supplier )
    else
      render :edit
    end
  end

  def destroy
    @supplier.destroy
    redirect_to suppliers_path
  end

  def upload
    respond_to do |format|      
      format.html
      format.js {        
        $suppliers = []        
        begin            
          $suppliers = Supplier.parse_from_xls( params[:files] )
        rescue            
          render :template => "suppliers/upload.js.erb"
        end
      }
    end
  end

  def save
    $suppliers.each { |supplier| supplier.save }
    $suppliers = []
    redirect_to suppliers_path
  end

  private

  def find_supplier
    @supplier = Supplier.find( params[:id] )
  end

  def supplier_params
    params.require( :supplier ).permit( :category_number, :category, :company_number, :company_name, :company_brief_name, :name, :title, :phone, :tax_phone, :mobile_phone, :address, :email, :vat_number, :note, :old_created_at, :contact )
  end
end
