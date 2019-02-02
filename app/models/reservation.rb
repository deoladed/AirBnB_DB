class Reservation < ApplicationRecord
	# validates CUSTOM
	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :start_must_be_before_end_time
	validate :start_in_the_future
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  has_many :calendars
  has_many :days, through: :calendars

  validate :overlaping_reservation?
	after_create :take_days, :send_welcome_message



	def take_days
		days_from_start_to_end = [start_date]
		while days_from_start_to_end.include?(end_date) == false
			stay_time.times do |i|
				days_from_start_to_end << start_date + (i + 1).day
			end
		end
		days_from_start_to_end.each do |day|
			Day.create(name: day, is_taken_by: self.listing.id)
		end
  end

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

	def start_in_the_future
		errors.add(:start_date, "must be in the futur") unless
	        start_date > Time.now
	end

  def is_started?
    	start_date < Time.now
  end

  def is_over?
  		end_date < Time.now
  end

	def overlaping_reservation?
		days_from_start_to_end = [start_date]
		while days_from_start_to_end.include?(end_date) == false
			stay_time.times do |i|
				days_from_start_to_end << start_date + (i + 1).day
			end
		end

		days_from_start_to_end.each do |day|
			Day.all.each do |haha|
				if haha.is_taken_by == self.listing.id && haha.name == day
					errors.add(:start_date, "Jours pris frere!")
				end
			end
		end
	end
end
