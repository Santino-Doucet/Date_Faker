class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :age, presence: true, comparison: { greater_than_or_equal_to: 18 }
end
