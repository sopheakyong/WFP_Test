class StudentsController < ApplicationController
    # the first code in action show, edit, update and destroy are the same, we hate the duplicated code, use before_filter to avoid.
    # duplicate code is @student=Student.find(params[:id])
    # Refactor
    before_action :find_student, only: [:show, :edit, :update, :destroy]

    # this action method for diplay list of student
    # # GET /students

    @menu="Student"
    def index
      
        #StudentSchool.delete_all
        #StudentPerformance.delete_all
        @student_filter=Student.new #this variable for using with form_for for searching       
       
        #for fix error first time loading
        if params[:student].present?
            @student_id = params[:student][:student_id]
            @student_name = params[:student][:student_name]
            @student_sex =params[:student][:sex]
            @caption_button_student="ViewStudent" # for hight on menu when click on search
            @student=Student.order(:student_name)
        else
            @student=Student.order(:id) # first time load
        end
        
        @student=@student.where(student_id: @student_id) if @student_id.present?
        @student=@student.where("student_name like ?", "%#{@student_name}%") if @student_name.present?
        @student=@student.where(sex: @student_sex) if @student_sex.present?
       
        
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
        @student=Student.new
        @caption_button_student="Register"
    end

    #this action method for save student information into database when user click on button register
    # POST /students
    def create 
        @student = Student.new(student_params)
        if @student.save
          redirect_to edit_student_path(@student)
        else
          render :new
        end   
    end    
    #this action method for getting a student's information to edit when user click on button edit
    #GET /students/1/edit
    def edit
        #@student = Student.find(params[:id])
        @caption_button_student="Update" #this variable use to cheng the lable of button in student form partial to Update

    end

    #this action method for update a student's information into database when user click button update
    ## PATCH/PUT /students/1
    def update
        #@student = Student.find(params[:id])
        # the existing model record. 
        if @student.update(student_params)
            # Redirect the browser to edit of student
            redirect_to edit_student_path
          else
            # Redirect the browser to edit of student
            render :edit
          end
      end

    #this action method for deleting a student'sinformation from database when user click on button delete
    def destroy
        #@student= Student.find(params[:id])
        @student.destroy
        redirect_to students_path
      end

    #this method is used for getting information from parameter when user click on button register or update
    #is used to filter the trusted parameters with a white list
    # Never trust parameters from the scary internet, only allow the white list through
    private
    def student_params
      params.require(:student).permit(:student_id, :student_name, :sex, :date_of_birth)
    end

    # Use callbacks to share common setup or constraints between actions.
    def find_student
        # Look up the existing model record based
        # on an ID from the request path.
        @student = Student.find(params[:id])
      end

end
