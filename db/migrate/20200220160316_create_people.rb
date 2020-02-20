class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :last_name
      t.integer :linkedIn_id
      t.date :born_date
      t.string :phone
      t.string :url
    end
  end
end
