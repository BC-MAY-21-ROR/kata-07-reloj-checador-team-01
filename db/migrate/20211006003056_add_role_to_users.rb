# The AddRoleToUsers migration add superadmin and user role fields to users table for authorization process
class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end
end
