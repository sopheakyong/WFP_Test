class Student < ApplicationRecord    
    #the association between student and student_school
    has_many :student_schools

    #the association between student and school through student_school
    has_many :schools, through: :student_schools
    
    #the association between student and student_performance
    has_many :student_performances
    #the association between student and school through student_performance
    has_many :schools, through: :student_performances


    validates :student_id, presence: true,  length: {minimum: 3, maximum: 5}
    validates_uniqueness_of :student_id
    validates :student_name, presence: true, length: {minimum: 3, maximum: 50}
    validates :sex, :date_of_birth, presence: true    
  

   

end
