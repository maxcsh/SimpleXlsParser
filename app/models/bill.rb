class Bill < ActiveRecord::Base

  has_many :shipping_lists
  before_validation :calculate_total_price

  def self.parse_multi_files( files )
    bills = []

    files.each do |f|      
      bill = Bill.new
      bill.parse_from_xls( f )
      bills << bill
    end
    bills
  end


  def parse_from_xls( file )    
    book = Spreadsheet.open( file.path )
    sheet = book.worksheet 0

    self.company_number = sheet.rows[2][0].split("廠商編號: ")[1]
    self.vat_number = sheet.rows[3][0].split("統一編號:")[1].first(8)
    self.company_phone = sheet.rows[3][0].split("公司電話:")[1]
    self.company_address = sheet.rows[4][0].split("公司地址:")[1]    

    index = 10

    while sheet.rows[index][0] != "***********"
      if !sheet.rows[index][0].blank?     
        list_number = sheet.rows[index][0]
        list = self.shipping_lists.new(
          :list_number => list_number,
          :note => sheet.rows[index][9],        
        )      
      end
      item = list.shipping_items.new(
        :item_name => sheet.rows[index][1],
        :spec => sheet.rows[index][2],
        :amount => sheet.rows[index][3],
        :unit => sheet.rows[index][4],
        :unit_price => sheet.rows[index][5]
      )
      
      item.validate!
      list.validate!
      index += 1
    end

    self.pre_paid = sheet.rows[index + 5][0].split("預 付 款:")[1].split("前期餘額:")[0].try( :to_f )
    
    self.validate!
  end

  private

  def calculate_total_price
    self.total_price = 0
    self.tax_price =0
    self.shipping_lists.each do |list|
      self.total_price += list.total_price if !list.total_price.blank?
      self.tax_price += list.tax_price if !list.tax_price.blank?
    end

    self.tax = self.tax_price - self.total_price if self.tax_price && self.total_price
    self.to_be_paid = self.tax_price
    self.to_be_paid -= self.pre_paid if self.pre_paid
  end
end
