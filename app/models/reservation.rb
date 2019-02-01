class Reservation < ApplicationRecord
	# validates CUSTOM
	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :start_must_be_before_end_time
	validate :doesnt_start_in_the_future
  belongs_to :listing
  belongs_to :user

	after_create :send_welcome_message

  def send_welcome_message
    	puts self.listing.welcome_message
  end

	def stay_time
		(end_date.to_i - start_date.to_i)/86400
	end

	def start_must_be_before_end_time
	    errors.add(:start_date, "must be before end time") unless
	        start_date < end_date
	end 

	def doesnt_start_in_the_future
		errors.add(:start_date, "must be in the futur") unless
	        start_date > Time.now
	end

  def is_started
    	start_date < Time.now
  end

	def overlaping_reservation?(datetime)
	  # vérifie dans toutes les réservations du listing s'il y a une réservation qui tombe sur le datetime en entrée
	end
end
# start date in past