class CreateShortAnswers < ActiveRecord::Migration
  def self.up
    create_table :short_answers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :short_answers
  end
end
