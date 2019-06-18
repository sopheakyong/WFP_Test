class UsersController < ApplicationController

 # the first code in action show, edit, update and destroy are the same, we hate the duplicated code, use before_filter to avoid.
    # duplicate code is @user=User.find(params[:id])
    # Refactor
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    
        # this action method for diplay list of student
        # # GET /users
        def index
           @user=User.all
        end
        
        #this action method for getting information detail for a user
        # GET /users/1
        def show
             # Look up the existing model record based
             # on an ID from the request path.
             #@user=User.find(params[:id])
        end
        #this action method for new user when user click button new user
        # # GET /users/new
        def new
           @user=User.new
            @caption_button_user="Create"
        end
    
        #this action method for save student information into database when user click on button add user
        # POST /users
        def create 
           @user = User.new(user_params)
            if@user.save
              redirect_to edit_user_path(@user)
            else
              render :new
            end   
        end    
        #this action method for getting a user's information to edit when user click on button edit
        #GET /users/1/edit
        def edit
            #@user = User.find(params[:id])
            @caption_button_user="Update" #this variable use to cheng the lable of button in user form partial to Update
    
        end
    
        #this action method for update a user's information into database when user click button update
        ## PATCH/PUT /users/1
        def update
            #@user = User.find(params[:id])
            # the existing model record. 
            if@user.update(user_params)
    
                # Redirect the browser to edit of user
                redirect_to edit_user_path
              else
                # Redirect the browser to edit of user
                render :edit
              end
          end
    
        #this action method for deleting a user's information from database when user click on button delete
        def destroy
            #@user= User.find(params[:id])
           @user.destroy
            redirect_to users_path
          end
    
        #this method is used for getting information from parameter when user click on button register or update
        #is used to filter the trusted parameters with a white list
        # Never trust parameters from the scary internet, only allow the white list through
        private
        def user_params
          params.require(:user).permit(:user_name, :password)
        end
    
        # Use callbacks to share common setup or constraints between actions.
        def find_user
            # Look up the existing model record based
            # on an ID from the request path.
           @user = User.find(params[:id])
        end

        def attempt_login
        end

        

end
