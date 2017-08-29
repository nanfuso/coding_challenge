class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.string :zip_code
      t.string :day
      t.string :high
      t.string :low
      t.string :description

      t.timestamps
    end
  end
end
