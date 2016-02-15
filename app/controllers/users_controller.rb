class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@program = current_user.masjids.order("tajuk")
		@program_penceramah = current_user.penceramahs.order("tajuk")
	end

	def edit
		@user = User.find(params[:id])
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

