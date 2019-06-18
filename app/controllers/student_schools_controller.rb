class StudentSchoolsController < ApplicationController

 # the first code in action show, edit, update and destroy are the same, we hate the duplicated code, use before_filter to avoid.
    # duplicate code is @student=Student.find(params[:id])
    # Refactor
    before_action :find_student, only: [:show, :edit, :update, :destroy]
    
        # this action method for diplay list of student
        # # GET /students
        def index
            @student_school=StudentSchool.all
        end
        
        #this action method for getting information detail for a student
        # GET /students/1
        def show
             # Look up the existing model record based
             # on an ID from the request path.
             #@student=Student.find(params[:id])
        end
        #this action method for new student when user click button new student
        # # GET /students/new
        def new
            @student_school=StudentSchool.new
            @caption_button_student_school="Register"
        end
    
        #this action method for save student information into database when user click on button register
        # POST /students
        def create 
            @student_school = StudentSchool.new(student_params)
            if @student_school.save
              redirect_to edit_student_school_path(@student_school)
            else
              render :new
            end   
        end    
        #this action method for getting a student's information to edit when user click on button edit
        #GET /students/1/edit
        def edit
            #@student = Student.find(params[:id])
            @caption_button_student_school="Update" #this variable use to cheng the lable of button in student form partial to Update
    
        end
    
        #this action method for update a student's information into database when user click button update
        ## PATCH/PUT /students/1
        def update
            #@student = Student.find(params[:id])
            # the existing model record. 
            if @student_school.update(student_params)
    
                # Redirect the browser to edit of student
                redirect_to edit_student_school_path
              else
                # Redirect the browser to edit of student
                render :edit
              end
          end
    
        #this action method for deleting a student'sinformation from database when user click on button delete
        def destroy
            #@student= Student.find(params[:id])
            @student_school.destroy
            redirect_to stuents_path
          end
    
        #this method is used for getting information from parameter when user click on button register or update
        #is used to filter the trusted parameters with a white list
        # Never trust parameters from the scary internet, only allow the white list through
        private
        def student_params
          params.require(:student_school).permit(:school_year, :school_id, :student_id, :grade)
        end
    
        # Use callbacks to share common setup or constraints between actions.
        def find_student
            # Look up the existing model record based
            # on an ID from the request path.
            @student_school = StudentSchool.find(params[:id])
          end

end
