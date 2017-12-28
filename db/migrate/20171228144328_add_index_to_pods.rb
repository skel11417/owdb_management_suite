class AddIndexToPods < ActiveRecord::Migration[5.0]
  def change
    add_index :pods, :id
  end
end
