class PocketCashesController < ApplicationController

  def index
    @pocket_cashes = PocketCash.all
  end

  def show
    @pocket_cash = PocketCash.find( params[:id] )
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
    @pocket_cash = PocketCash.find( params[:id] )
    @pocket_cash.destroy
    redirect_to pocket_cashes_path
  end

  def upload
    respond_to do |format|      
      format.html { puts "why html?" }
      format.js {        
        $pocket_cashes = []        
        begin            
          $pocket_cashes = PocketCash.parse_multi_files( params[:files] )
        rescue            
          render :template => "pocket_cashes/upload.js.erb"
        end
      }
    end
  end

  def save
    $pocket_cashes.each { |cash| cash.save }
    $pocket_cashes = []
    redirect_to pocket_cashes_path
  end

  private

  def pocket_cashes_params
    params.require( :pocket_cashes ).permit()
  end
end
