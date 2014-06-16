class UsersController < ApplicationController
  # What define type can only do
  before_action :signed_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: [:destroy]

  # Action: index a new User
	def new
		@user = User.new
	end

  # Action: show a user
	def show
		@user = User.find(params[:id])
	end

  # Action: Create a new User
	def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		flash[:success] = 'Welcome to MyMemoirs, you have been registrated!'
  		redirect_to @user
  	else
    		render 'new'
  	end
	end

  # Action: Edit a User
  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  # Action: Update a User
  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Your profile information have been updated.'
      redirect_to @user
    else
      render "edit"
    end
  end

  # Action: remove a User
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "The User :id has been deleted."
    redirect_to users_url
  end

	private
    # Attributes of a User no admin for security matters
  	def user_params
      	params.require(:user).permit(
      		:name, 
      		:email, 
      		:password, 
      		:password_confirmation)
    end

    # Filters for authorizations
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please, you need to sign in first."
      end
    end

    # Check if the current_user is a proper one
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Even if a dumb admin want to remove himself he can't! ;)
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
