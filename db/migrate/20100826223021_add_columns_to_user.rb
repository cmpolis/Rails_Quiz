class AddColumnsToUser < ActiveRecord::Migration

  #Clearance creates columns: email, password  

  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :private, :boolean
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :username
    remove_column :users, :private
  end
end
