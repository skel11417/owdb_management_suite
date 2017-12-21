class UpdateCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :travel_dates, :date, :date
  end
end
