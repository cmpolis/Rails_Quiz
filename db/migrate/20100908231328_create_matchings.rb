class CreateMatchings < ActiveRecord::Migration
  def self.up
    create_table :matchings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :matchings
  end
end
