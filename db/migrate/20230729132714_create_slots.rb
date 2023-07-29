class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.string :repository, null: false
      t.integer :issue_number, null: false

      t.timestamps
    end
  end
end
