class AddEmailToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :email, :string
  end
end
