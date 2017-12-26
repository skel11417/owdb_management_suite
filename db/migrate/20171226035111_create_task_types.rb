class CreateTaskTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_types do |t|
      t.string "name"
      t.integer "date_offset"
      t.timestamps
    end
  end
end
