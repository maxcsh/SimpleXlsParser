class BusinessCardsController < ApplicationController

  before_action :find_card , :only => [ :show , :edit , :update , :destroy ]


  def index
    @cards = BusinessCard.all
  end

  def show    
  end

  def new
    @card = BusinessCard.new
  end

  def create
    @card = BusinessCard.new( business_card_params )
    if @card.save
      redirect_to business_card_path( @card )
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update( business_card_params )
      redirect_to business_card_path( @card )
    else
      render :edit
    end
  end

  def destroy    
    @card.destroy
    redirect_to business_cards_path
  end

  def upload
    respond_to do |format|      
      format.html
      format.js {        
        $cards = []        
        begin            
          $cards = BusinessCard.parse_from_xls( params[:files] )
        rescue            
          render :template => "business_cards/upload.js.erb"
        end
      }
    end
  end

  def save
    $cards.each { |card| card.save }
    $cards = []
    redirect_to business_cards_path
  end

  private

  def find_card
    @card = BusinessCard.find( params[:id] )
  end

  def business_card_params
    params.require( :business_card ).permit(:category_number, :category, :company_name, :name, :title, :phone, :tax_phone, :mobile_phone, :address, :email, :vat_number, :note, :old_created_at )
  end
end
