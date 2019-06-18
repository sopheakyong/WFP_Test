class School < ApplicationRecord
    has_many :student_schools
    has_many :students, through: :student_schools

    #the association between school and student_performance
    has_many :student_performances
    #the association between school and student through student_performance
    has_many :students, through: :student_performances
   
    validates :school_code, presence: true, length: {minimum: 3, maximum: 5}
    validates_uniqueness_of :school_code
    validates :school_name, presence: true, length: {minimum: 3, maximum: 25}
    validates_uniqueness_of :school_name

end
