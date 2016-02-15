class Program < ActiveRecord::Base
	belongs_to :user
	searchkick

  def self.search(search)
    if search
        @program = Program.where(["tajuk LIKE ?","%#{search}%"])
    else
        all
    end
  end
end
