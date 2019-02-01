class User < ApplicationRecord
	validates :mail, 
  	presence: true, 
  	uniqueness: true,
  	format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :phone_number, presence: true
  has_many :reservations #as_user
  has_many :listings #as_admin

  def is_admin?
  	self.listings.count > 0
  end

  def is_guest?
  	self.reservations
  end
end

# if self.logement.user = self => is admin

# 	Dans resa : who's is_guest