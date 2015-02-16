class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
	end

	def show
		@user = User.find(params[:id])
		end

 def new
  	@user = User.new
  	render :new
  end

  def create
  	@user = User.create(user_params)
  	redirect_to user_path(@user.id)
  end

  def edit
  end


private
  	def user_params
  		params.require(:user).permit(:email, :password, :password_confirmation)
  	end

end
