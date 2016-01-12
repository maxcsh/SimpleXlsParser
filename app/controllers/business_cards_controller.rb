class BusinessCardsController < ApplicationController
  def index
    @cards = BusinessCard.all
  end

  def show
    @card = BusinessCard.find( params[:id] )
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
    @card = BusinessCard.find( params[:id] )
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

  def business_card_params
    params.require( :business_cards ).permit()
  end
end
