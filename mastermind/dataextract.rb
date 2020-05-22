require 'spreadsheet'

class Extractor
  def initialize
    @book = Spreadsheet::Workbook.new
    @sheet1 = @book.create_worksheet
    @sheet1.name = 'Data'
    @sheet1.row(0).concat %w[Combo Turns_to_solve]
  end

  def extract_info(combos, table)
    table.length.times { |i| @sheet1.row(i).push(combos[i], table[i] - 1) }
    @book.write('stats.xls')
  end
end
