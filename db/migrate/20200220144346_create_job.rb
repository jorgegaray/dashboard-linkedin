class CreateJob < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :role, null: false
      t.date :start_date
      t.date :end_date
      t.integer :company_id
    end

    add_reference :company, :job, foreign_key: true, index: false
  end
end
