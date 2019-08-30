class Course < ApplicationRecord
	has_many :comments
	validates_presence_of :title, :price
end
