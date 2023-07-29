class AddExperienceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :experience, :integer, null: false, default: 1
  end
end
