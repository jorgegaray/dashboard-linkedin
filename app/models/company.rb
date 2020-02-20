# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string
#  area        :string
#  web         :string
#  linkeind_id :integer
#  country     :integer          default(0)
#  size        :integer
#  email       :string
#

class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  enum country: [:chile, :colombia, :peru]

  scope :buscar, -> { where("name LIKE '%?%' OR area '%?%'", name, area) }

     
end
