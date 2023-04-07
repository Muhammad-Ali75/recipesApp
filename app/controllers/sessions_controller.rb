class SessionsController < ApplicationController
    def new

    end
    
    def create
        @chef= Chef.find_by_email(params[:session][:email].downcase)
        if @chef && @chef.authenticate(params[:session][:password])
            session[:chef_id]= @chef.id
            flash[:success]="You are logged in"
            redirect_to @chef
        else
            flash.now[:danger]="Credentials are not correct"
            render 'new', status:   300
        end
    end

    def destroy
        session[:chef_id]= nil
        flash[:success]="You have been successfully logged out"
        redirect_to root_path
    end
end