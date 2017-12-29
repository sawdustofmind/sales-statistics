class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :good
      t.date :day
      t.decimal :score, precision: 13, scale: 2
    end
  end
end
