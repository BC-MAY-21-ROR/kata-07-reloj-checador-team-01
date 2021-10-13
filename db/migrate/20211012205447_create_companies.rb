class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :address, limit: 50, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
