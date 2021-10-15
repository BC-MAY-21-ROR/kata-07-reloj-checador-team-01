class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :private_number, null: false 
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employees, :email,                unique: true
    add_index :employees, :private_number,       unique: true
  end
end
