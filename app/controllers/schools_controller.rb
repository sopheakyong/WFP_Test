class SchoolsController < ApplicationController
     # the first code in action show, edit, update and destroy are the same, we hate the duplicated code, use before_filter to avoid.
    # duplicate code is @school=school.find(params[:id])
    # Refactor
    before_action :find_school, only: [:show, :edit, :update, :destroy]
    
        # this action method for diplay list of School
        # # GET /schools
        def index
            @school=School.all
        end
        
        #this action method for getting information detail for a School
        # GET /schools/1
        def show
             # Look up the existing model record based
             # on an ID from the request path.
             #@school=School.find(params[:id])
        end
        #this action method for new School when user click button new School
        # # GET /schools/new
        def new
            @school=School.new
            @caption_button_school="Add"
        end
    
        #this action method for save School information into database when user click on button register
        # POST /schools
        def create 
            @school = School.new(school_params)
            if @school.save
              redirect_to edit_school_path(@school)
            else
              render :new
            end   
        end    
        #this action method for getting a School's information to edit when user click on button edit
        #GET /schools/1/edit
        def edit
            #@school = School.find(params[:id])
            @caption_button_school="Update" #this variable use to cheng the lable of button in School form partial to Update
    
        end
    
        #this action method for update a School's information into database when user click button update
        ## PATCH/PUT /schools/1
        def update
            #@school = School.find(params[:id])
            # the existing model record. 
            if @school.update(school_params)
    
                # Redirect the browser to edit of School
                redirect_to edit_school_path
              else
                # Redirect the browser to edit of School
                render :edit
              end
          end
    
        #this action method for deleting a School's information from database when user click on button delete
        def destroy
            #@school= School.find(params[:id])
            @school.destroy
            redirect_to schools_path
          end
    
        #this method is used for getting information from parameter when user click on button register or update
        #is used to filter the trusted parameters with a white list
        # Never trust parameters from the scary internet, only allow the white list through
        private
        def school_params
          params.require(:school).permit(:school_code, :school_name)
        end
    
        # Use callbacks to share common setup or constraints between actions.
        def find_school
            # Look up the existing model record based
            # on an ID from the request path.
            @school = School.find(params[:id])
          end
end
