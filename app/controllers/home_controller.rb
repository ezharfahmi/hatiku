class HomeController < ApplicationController
  def index
  	@program = Program.page(params[:page]).per_page(5).order("id desc")
  end
end
