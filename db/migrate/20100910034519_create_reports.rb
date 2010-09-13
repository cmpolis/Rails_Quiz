class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :user_id
      t.boolean :fixed
      t.string :text
      t.integer :quiz_id
      t.integer :reason
      t.integer :status

      t.timestamps
    end
    add_index :reports, [:user_id, :quiz_id]
  end

  def self.down
    add_index :reports, [:user_id, :quiz_id]
    drop_table :reports
  end
end
