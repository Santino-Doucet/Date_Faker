class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :offers
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :age, comparison: { greater_than: 18 }
  validates :hair_color, inclusion: { in: %w(black white grey blue ginger green red blond other) }
end
