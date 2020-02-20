class CreateJob < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.belongs_to :company
      t.belongs_to :person
      t.string :role
      t.date :start_date
      t.date :end_date
    end
  end
end
