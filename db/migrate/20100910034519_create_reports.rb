class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.integer :user_id
      t.boolean :fixed
      t.string :text
      t.integer :quiz_id
      t.integer :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
