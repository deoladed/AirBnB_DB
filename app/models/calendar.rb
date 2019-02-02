class Calendar < ApplicationRecord
	belongs_to :day
	belongs_to :reservation
end
