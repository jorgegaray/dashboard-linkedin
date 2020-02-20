# == Schema Information
#
# Table name: people
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  last_name   :string
#  linkedIn_id :integer
#  born_date   :date
#  phone       :string
#  url         :string
#  job_id      :bigint
#  email       :string
#

class Person < ApplicationRecord
    has_many :jobs, dependent: :destroy
end
