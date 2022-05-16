class User < ApplicationRecord
  has_many :shoes
  has_many :shoes, through: :rentals
  validates :name, :email, presence: true, uniqueness: true
end
