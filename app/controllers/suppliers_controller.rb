class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find( params[:id] )
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @supplier = Supplier.find( params[:id] )
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

  def supplier_params
    params.require( :supplier ).permit()
  end
end
