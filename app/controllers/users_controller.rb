class UsersController < ApplicationController

  #create a new form for new user
	def index 
    @users = User.all
  end

	#show details which entered by user into new form
	def show 
    @user = User.find(params[:id]) 
  end

	def new
		@user = User.new
	end

  #edit details in form
	def edit 
    @user = User.find(params[:id]) 
  end

  #creating a new user
	def create 
    @user = User.new(user_params) 
    if @user.save
       redirect_to @user
    else
       render 'new'
    end
  end

  #updating a user detail
  def update 
  	@user = User.find(params[:id])
   	if @user.update(user_params)
      redirect_to @user
   	else
      render 'edit'
   	end
  end

  #delete a user
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

 	private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :years_of_education)
  end
end
