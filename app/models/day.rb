class Day < ApplicationRecord
	has_many :calendars
  has_many :reservations, through: :calendars
	# belongs_to :reservation
end
