class RemoveDefaultOnPodModel < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:pods, :confirmed, nil)
  end
end
