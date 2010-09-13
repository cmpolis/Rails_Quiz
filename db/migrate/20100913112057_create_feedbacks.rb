class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :body
      t.string :email
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
