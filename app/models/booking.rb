class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :booked_on, presence: true
end
