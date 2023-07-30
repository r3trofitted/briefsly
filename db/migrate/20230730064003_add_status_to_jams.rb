class AddStatusToJams < ActiveRecord::Migration[7.0]
  def change
    add_column :jams, :status, :integer, null: false, default: 0
  end
end
