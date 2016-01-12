class BusinessCard < ActiveRecord::Base

  def self.parse_from_xls( file )    
    cards = []
    #binding.pry
    book = Spreadsheet.open( file.first.path )
    sheet = book.worksheet 0
    
    index = 1
    last = sheet.rows.length
    rows = sheet.rows
    while index < last
      card = BusinessCard.new(
        :category_number => rows[index][0],
        :category => rows[index][1],
        :company_name => rows[index][2],
        :name => rows[index][3],
        :title => rows[index][4],
        :phone => rows[index][5],
        :tax_phone => rows[index][6],
        :mobile_phone => rows[index][7],
        :address => rows[index][8],
        :email => rows[index][9],
        :vat_number => rows[index][10],
        :note => rows[index][11],
        :old_created_at => rows[index][12]
      )
      cards << card
      puts index
      index += 1
    end
    cards
  end
end
