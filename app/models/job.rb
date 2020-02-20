# == Schema Information
#
# Table name: jobs
#
#  id         :bigint           not null, primary key
#  company_id :bigint
#  person_id  :bigint
#  role       :string
#  start_date :date
#  end_date   :date
#

class Job < ApplicationRecord
    belongs_to :company, inverse_of: :jobs
    belongs_to :person, inverse_of: :jobs
end
