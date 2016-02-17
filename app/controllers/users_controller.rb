class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user1 = User.find(params[:id])
		if current_user.email == @user1.email
			@user = User.find(params[:id])
			@program = current_user.masjids.order("tajuk")
			@program_penceramah = current_user.penceramahs.order("tajuk")
		else
			redirect_to current_user
		end
	end

	def edit
		@user1 = User.find(params[:id])
		if current_user.email == @user1.email
			@user = User.find(params[:id])
		else
			redirect_to current_user, notice: "cannot edit other user" 
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to root_path, notice: "edit succesful"
		else
			render :edit
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :image, :dob, :name)
		end
end

