class AddColumnsToUser < ActiveRecord::Migration

  #Clearance creates columns: email, password  

  def self.up
    add_column :users, :FirstName, :string
    add_column :users, :LastName, :string
    add_column :users, :Username, :string
  end

  def self.down
    remove_column :users, :FirstName
    remove_column :users, :LastName
    remove_column :users, :Username
  end
end
