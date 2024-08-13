class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :photos, presence: true
  validates :title, presence: true
  validates :description, presence: true, length: { in: 20..500 }
  validates :localisation, presence: true
  validates :price, presence: true, comparison: { greater_than: 1 }
end
