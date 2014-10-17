class UsersController < ApplicationController

http_basic_authenticate_with name: "secret", password: "secret", except: :index
before_action :set_user, only: [:show, :edit, :update, :destroy]


def index
  @users = User.all
end

def new
  @users = User.all
end

def create
  @user = User.new(user_params)
    if @user.save
      redirect_to root_path, :notice =>  "Created!"  
    else
      render :new
    end
end   

def destroy
  @user.destroy  
  redirect_to users_path
end

def update
  if user.update(ticket_params)
    redirect_to users_path
  else
    render "edit"
end

private

def user_params
  params.require(:user).permit(:login, :password)
end

def set_user
  @user = User.find(params[:id])
end

end
