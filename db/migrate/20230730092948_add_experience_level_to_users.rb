class AddExperienceLevelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :experience_level, :integer, null: true
  end
end
