class CreateCompany < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :description
      t.string :area
      t.string :web
      t.integer :linkind_id
      t.integer :country, default: 0
      t.integer :size
      t.string :email
    end
  end
end
