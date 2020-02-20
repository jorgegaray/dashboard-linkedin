class Person < ApplicationRecord
    has_many :jobs, dependent: :destroy
end
