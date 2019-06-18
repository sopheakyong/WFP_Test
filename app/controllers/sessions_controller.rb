class SessionsController < ApplicationController
  
   
   layout 'admin'
   
    def new
    end

    def create
        #debugger     
        user = User.where(user_name:params[:session][:user_name])      
        user=user.find_by_password(params[:session][:password])
        # #if user && user.authenticate(params[:session][:password])
        if user
          session[:user_id] = user.id
          redirect_to root_url, notice: "Logged in!"
        else
          flash.now[:alert] = "User or password is invalid"
          render "new"
        end





    end

    # fro logout
    def destroy
       # session[:user_id] = nil
        #flash[:success]="You have logged out"
        redirect_to root_url, notice: "Logged out!"
    end 


end
