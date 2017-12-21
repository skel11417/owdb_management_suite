class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string "abbr"
      t.string "name"
      t.timestamps
    end
  end
end
