class AddFirstnameAndLastnameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname_string, :string
  end
end
