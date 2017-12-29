# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'simple_xlsx_reader'

workbook = SimpleXlsxReader.open './db/data_source.xlsx'
worksheets = workbook.sheets
puts "Found #{worksheets.count} worksheets"

if worksheets.count > 0 then
  worksheet = worksheets[0]
  puts "Reading: #{worksheet.name}"
  num_rows = 0

  first_row = worksheet.rows[0]

  # reading
  worksheet.rows.each do |row|
    if row[0] && row[0] != 'Good'
      1.upto(first_row.length - 1) do |i|
        good = row[0].to_s.strip
        day = first_row[i].to_s.strip
        score = row[i].to_s.strip

        # creating the record on parsed data
        puts "#{good} by #{day}: #{score}"
        Sale.create(good: good, day: day, score: score)
      end
      num_rows += 1
    end
  end
  puts "Read #{num_rows} rows"
end
