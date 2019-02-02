class User < ApplicationRecord
	validates :mail, 
  	presence: true, 
  	uniqueness: true,
  	format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :phone_number, presence: true
  has_many :reservations, dependent: :destroy #as_guest classname reservations
  has_many :listings, dependent: :destroy #as_admin classneme listing


  def is_admin?
  	self.listings.count > 0
  end

  def is_guest?
  	self.reservations.empty? ? false : self.reservations.each {|resa| return true unless resa.is_over?}
  end
end
