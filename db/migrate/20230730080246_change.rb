class Change < ActiveRecord::Migration[7.0]
  def change
    remove_column :slots, :start_at, :datetime
    remove_column :slots, :end_at, :datetime

    add_column :slots, :start_at, :time, null: false
    add_column :slots, :end_at, :time, null: false

    add_column :slots, :date, :date, null: false
  end
end
