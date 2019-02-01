class Listing < ApplicationRecord
	validates :available_beds, presence: true, numericality: { greater_than: 0, only_integer: true }
	validates :price, presence: true, numericality: { greater_than: 0, only_integer: true }
	validates :description, presence: true, length: { minimum: 140 }
	validates :welcome_message, presence: true

	belongs_to :user
	belongs_to :city
	has_many :reservations
end
