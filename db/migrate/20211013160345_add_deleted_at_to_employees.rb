class AddDeletedAtToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :deleted_at, :datetime
  end
end
