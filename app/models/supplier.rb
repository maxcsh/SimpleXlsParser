class Supplier < ActiveRecord::Base

  #廠商編號 company_number
  #廠商簡稱 company_brief_name
  #公司地址 address
  #電話     phone   
  #統一編號 vat_number
  #聯 絡 人 contact

  def self.parse_from_xls( file )    
    suppliers = []
    
    book = Spreadsheet.open( file.first.path )
    sheet = book.worksheet 0
    
    index = 7
    last = sheet.rows.length - 2
    rows = sheet.rows
    while index < last
      supplier = Supplier.new(
        :company_number => rows[index][0],
        :company_brief_name => rows[index][1],
        :address => rows[index][2],
        :phone => rows[index][3],
        :vat_number => rows[index][4],
        :contact => rows[index][5]        
      )
      suppliers << supplier
      index += 1
    end
    suppliers
  end

end
