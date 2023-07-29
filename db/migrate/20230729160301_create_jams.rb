class CreateJams < ActiveRecord::Migration[7.0]
  def change
    create_table :jams do |t|
      t.references :slot, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: { to_table: :users }
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end
  end
end
