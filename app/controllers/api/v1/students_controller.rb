module Api
    module V1
            class StudentsController < ApplicationController

                def index
                    #  sample 1
                    #  performance=StudentPerformance.joins(:students)
                    # .select('students.student_id,students.student_name,students.sex,students.date_of_birth,student_performances.*')

                    #sample 2
                    # performance=StudentPerformance.joins(:student, :school).select('students.student_name,students.sex,students.date_of_birth,student_performances.*')
                    
                    school_year=params[:school_year]
                    student_id=params[:student_id]

                    performance=Student.joins(student_performances: :school)
                    .select('students.id,students.student_id,students.student_name,students.sex,students.date_of_birth,student_performances.school_year,schools.school_name,student_performances.grade
                            ,student_performances.math_s1,student_performances.khmer_s1,student_performances.social_s1,student_performances.math_s2,student_performances.khmer_s2,student_performances.social_s2
                            ,student_performances.math_s1+student_performances.khmer_s1+student_performances.social_s1 as total_semeter1
                            ,(student_performances.math_s1+student_performances.khmer_s1+student_performances.social_s1)/3 as avg_semester1
                            ,student_performances.math_s2+student_performances.khmer_s2+student_performances.social_s2 as total_semeter2
                            ,(student_performances.math_s2+student_performances.khmer_s2+student_performances.social_s2)/3 as avg_semester2
                            ,(student_performances.math_s1+student_performances.khmer_s1+student_performances.social_s1) + (student_performances.math_s2+student_performances.khmer_s2+student_performances.social_s2) as total_semester
                            ,((student_performances.math_s1+student_performances.khmer_s1+student_performances.social_s1) + (student_performances.math_s2+student_performances.khmer_s2+student_performances.social_s2))/2 as avg_semester
                    ')
                    performance=performance.where(student_performances:{school_year: school_year},students:{student_id:student_id})
                    if(performance.present?)
                        render json: {status: 'SUCCESS', message:'Loaded student information', data:performance}, status: :ok
                    else
                        render json: {status: 'FAILS', message:'No student information', data:[]}, status: :ok                        
                    end
               
                end

                #for get list of student the filter by schol_year and school_id
                def get_student

                    school_year=params[:school_year]
                    school_id=params[:school_id]
                    student=Student.order(:student_name)
                    student=student.joins(:student_schools).select('students.id,students.student_id,students.student_name')
                    student=student.where(student_schools:{school_year: school_year}) if school_year.present?
                    student=student.where(student_schools:{school_id: school_id}) if school_id.present?
                    if(student.present?)
                        render json: {status: 'SUCCESS', message:'Loaded student information', data:student}, status: :ok
                    else
                        render json: {status: 'FAILS', message:'No student information', data:[]}, status: :ok                        
                    end
                end
            end
    end
end