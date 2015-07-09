class Movie < ActiveRecord::Base
	validates_presence_of :title, :description, :year_released
end

def self.search(search)
  where("title LIKE ?", "%#{search}%") 
  where("year_released LIKE ?", "%#{search}%")
end
