class Booking < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :offer, dependent: :destroy
  validates :date, presence: true
end
