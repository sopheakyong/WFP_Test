class StudentPerformancesController < ApplicationController

     # the first code in action show, edit, update and destroy are the same, we hate the duplicated code, use before_filter to avoid.
    # duplicate code is @student_performance=StudentPerformance.find(params[:id])
    # Refactor
    before_action :find_student_formance, only: [:show, :edit, :update, :destroy]
    
        # this action method for diplay list of StudentPerformance
        # # GET /student_performances
        def index
            
            @student_filter=StudentPerformance.new #this variable for using with form_for for searching       
            
            #for fix error first time loading
             if params[:student_performance].present?
                 @school_year = params[:student_performance][:school_year]
                 @school_id = params[:student_performance][:school_id]
                 @grade = params[:student_performance][:grade]
                 @student_name =params[:student_performance][:student_name]
                 @caption_button_student="ViewPerformance" # for hight on menu when click on search
                 @student_performance=StudentPerformance.joins(:student).order(:id)
             else
                 @student_performance=StudentPerformance.order(:id) # first time load
             end
            
             @student_performance=@student_performance.where(school_year: @school_year) if @school_year.present?
             @student_performance=@student_performance.where(school_id: @school_id) if @school_id.present?
             @student_performance=@student_performance.where(grade: @grade) if @grade.present?
             @student_performance=@student_performance.where("student_name like ?", "%#{@student_name}%") if @student_name.present?
        



        end
        
        #this action method for getting information detail for a StudentPerformance
        # GET /student_performances/1
        def show
             # Look up the existing model record based
             # on an ID from the request path.
             #@student_performance=StudentPerformance.find(params[:id])
        end
        #this action method for new StudentPerformance when user click button new StudentPerformance
        # # GET /student_performances/new
        def new
            @student_performance=StudentPerformance.new
            @caption_button_student_performance="Add"
        end
    
        #this action method for save StudentPerformance information into database when user click on button add
        # POST /student_performances
        def create 
            @student_performance = StudentPerformance.new(student_params)
            if @student_performance.save
              redirect_to edit_student_performance_path(@student_performance)
            else
              render :new
            end   
        end    
        #this action method for getting a StudentPerformance's information to edit when user click on button edit
        #GET /student_performances/1/edit
        def edit
            #@student_performance = StudentPerformance.find(params[:id])
            @caption_button_student_performance="Update" #this variable use to cheng the lable of button in StudentPerformance form partial to Update
    
        end
    
        #this action method for update a StudentPerformance's information into database when user click button update
        ## PATCH/PUT /student_performances/1
        def update
            #@student_performance = StudentPerformance.find(params[:id])
            # the existing model record. 
            if @student_performance.update(student_params)
    
                # Redirect the browser to edit of StudentPerformance
                redirect_to edit_student_performance_path
              else
                # Redirect the browser to edit of StudentPerformance
                render :edit
              end
          end
    
        #this action method for deleting a StudentPerformance'sinformation from database when user click on button delete
        def destroy
            #@student_performance= StudentPerformance.find(params[:id])
            @student_performance.destroy
            redirect_to stuent_performances_path
          end
    
        #this method is used for getting information from parameter when user click on button register or update
        #is used to filter the trusted parameters with a white list
        # Never trust parameters from the scary internet, only allow the white list through
        private
        def student_params
          params.require(:student_performance).permit(:school_year, :school_id, :student_id, :grade,:math_s1,:khmer_s1,:social_s1,:math_s2,:khmer_s2,:social_s2)
        end
    
        # Use callbacks to share common setup or constraints between actions.
        def find_student_formance
            # Look up the existing model record based
            # on an ID from the request path.
            @student_performance = StudentPerformance.find(params[:id])
          end

end
