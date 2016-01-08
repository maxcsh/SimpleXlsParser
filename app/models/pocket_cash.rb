class PocketCash < ActiveRecord::Base

  has_many :pocket_items
  before_validation :calculate_total_price

  def self.parse_multi_files( files )
    pocket_cashes = []

    files.each do |f|      
      pocket_cash = PocketCash.new
      pocket_cash.parse_from_xls( f )
      pocket_cashes << pocket_cash
    end
    pocket_cashes
  end


  def parse_from_xls( file )    
    book = Spreadsheet.open( file.path )
    sheet = book.worksheet 0
    index = 7
    while sheet.rows[index][0] != "************"
      new_date = sheet.rows[index][0].to_date if !sheet.rows[index][0].blank?
      self.pocket_items.new(
        :item_date => new_date,
        :subject => sheet.rows[index][1],
        :description => sheet.rows[index][2],
        :item_type => sheet.rows[index][3],
        :price => sheet.rows[index][4],
        :summons_number => sheet.rows[index][5],
        :note => sheet.rows[index][6],
        :project_code => sheet.rows[index][7]
      )
      index += 1
    end
    self.validate!
  end

  private

  def calculate_total_price
    sum = 0
    self.pocket_items.each do |item|
      case item.item_type
      when "支出"
        sum -= item.price
      when "收入"
        sum += item.price
      else
        sum -= item.price
      end
    end
    self.total_price = sum
  end

end
