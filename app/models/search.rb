class Search < ActiveRecord::Base

	def search_programs
	
		program = Program.all

		program = program.where(["npenceramah LIKE ?","%#{npenceramah}%"]) if npenceramah.present?
		program = program.where(["tajuk LIKE ?","%#{tajuk}%"]) if tajuk.present?
		program = program.where(["kitab LIKE ?",kitab]) if kitab.present?
		program = program.where(["location LIKE ?","%#{location}%"]) if location.present?
		program = program.where(["tarikh LIKE ?", tarikh]) if tarikh.present?

		return program
	end
end
