class CreateSupports < ActiveRecord::Migration
  def self.up
    create_table :supports do |t|
      t.integer :user_id
      t.string :body
      t.string :email
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :supports
  end
end
