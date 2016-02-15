class MasjidsController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource param_method: :program_params
	before_action :set_program, only: [:show, :edit, :update, :destroy]

	def index
		@program_by_date = current_user.masjids.group_by(&:tarikh)
		@program_by_date_penceramah = current_user.penceramahs.group_by(&:tarikh)
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
		@programblabla = Masjid.where(npenceramah: current_user.name).group_by(&:tarikh)
	end
	
	def new
		@program = Masjid.new
	end

	def create
		
		@program = current_user.masjids.new(program_params)

		@program.save

		if @program.save
			flash[:success] = "Success!"
			redirect_to @program
		else
			flash[:error] = "Error detected!"
			redirect_to new_masjid_path
		end
	end

	def show

	end

	def edit
	end

	def update
		if @program.update(program_params)
			redirect_to @program
		else
			render :edit
		end
	end

	def destroy
		@program.destroy
		redirect_to new_masjid_path
	end

	private
		def program_params
			params.require(:masjid).permit(:npenceramah, :tajuk, :kitab, :tarikh)
		end

		def set_program
			@program = Masjid.find(params[:id])
		end
end
