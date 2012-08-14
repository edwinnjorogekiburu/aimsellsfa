class AddUsernameEmailPasswordDigestToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :username , :string
  	add_column :employees, :email , :string
  	add_column :employees, :password_digest, :string
  	add_index :employees, :username , unique: true
  	add_index :employees, :email , unique: true
    add_column :employees, :remember_token, :string
    add_index  :employees, :remember_token
  end
end
