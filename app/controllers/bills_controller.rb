class BillsController < ApplicationController

  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find( params[:id] )
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
  end

  def upload
    respond_to do |format|      
      format.html
      format.js {        
        $bills = []        
        begin            
          $bills = Bill.parse_multi_files( params[:files] )
        rescue            
          render :template => "bills/upload.js.erb"
        end
      }
    end
  end

  def save
    $bills.each { |bill| bill.save }
    $bills = []
    redirect_to bills_path
  end

  private

  def pocket_cashes_params
    params.require( :pocket_cashes ).permit()
  end

end
