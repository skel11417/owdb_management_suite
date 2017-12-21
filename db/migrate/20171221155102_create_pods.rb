class CreatePods < ActiveRecord::Migration[5.0]
  def change
    create_table :pods do |t|
      t.integer "travel_date_id"
      t.date "arr_date"
      t.integer "country_id"
      t.integer "host_org_id"
      t.integer "grantee_id"
      t.string "theme"
      t.boolean "confirmed", default: false;
      t.text "notes"
      t.timestamps
    end
  end
end
