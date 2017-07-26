class CreateSleepingRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :sleeping_records do |t|
      t.references :user, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end
  end
end
