class AddColumnsToUser < ActiveRecord::Migration

  #Clearance creates columns: email, password  

  def self.up
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :username, :string
    add_column :users, :private, :boolean
  end

  def self.down
    remove_column :users, :bio
    remove_column :users, :location
    remove_column :users, :username
    remove_column :users, :private
  end
end
