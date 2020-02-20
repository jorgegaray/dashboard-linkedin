class AddRelationPersonToJob < ActiveRecord::Migration[5.1]
  def change

    add_reference :people, :job, foreign_key: true, index: true

  end
end
