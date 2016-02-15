class ProgramsController < ApplicationController

  	def index
		@program = Program.page(params[:page]).per_page(10).search(params[:search])
    end
end
