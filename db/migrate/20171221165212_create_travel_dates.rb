class CreateTravelDates < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_dates do |t|
      t.date
      t.timestamps
    end
  end
end
