class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer "task_type_id"
      t.integer "pod_id"
      t.integer "updated_by"
      t.timestamps
    end
  end
end
