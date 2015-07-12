class Movie < ActiveRecord::Base
	validates_presence_of :title, :description, :year_released
end

def self.search(search)
  if search
    where('title LIKE ?', "%#{search}%")
  else
    scoped
  end
end
