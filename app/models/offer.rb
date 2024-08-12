class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true
  validates :description, presence: true, length: { in: 20..500 }
  validates :localisation, presence: true
  validates :prix, presence: true, comparison: { greater_than: 1 }
end
