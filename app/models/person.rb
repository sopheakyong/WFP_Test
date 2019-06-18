class Person < ApplicationRecord
    validates :first_name, presence: true,  length: { minimum: 3 }
end
