class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :linkedIn_id
      t.string :last_name
      t.date :born_date
      t.string :phone
      t.string :url
    end
  end
end
