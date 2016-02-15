class PenceramahsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource param_method: :program_params
	before_action :set_program, only: [:show, :edit, :update, :destroy]

	def index
		@program_penceramah_by_date = current_user.penceramahs.group_by(&:tarikh)
		@date = params[:month] ? Date.parse(params[:month]) : Date.today
	end
	
	def new
		@program_penceramah = Penceramah.new
	end

	def create
		
		@program_penceramah = current_user.penceramahs.new(program_params)

		@program_penceramah.save

		redirect_to @program_penceramah
	end

	def show

	end

	def edit
	end

	def update
		if @program_penceramah.update(program_params)
			redirect_to @program_penceramah
		else
			render :edit
		end
	end

	def destroy
		@program_penceramah.destroy
		redirect_to new_penceramah_path
	end

	private
		def program_params
			params.require(:penceramah).permit(:tajuk, :kitab, :location, :tarikh, :start_time, :end_time, :npenceramah)
		end

		def set_program
			@program_penceramah = Penceramah.find(params[:id])
		end
end
