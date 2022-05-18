class Shoe < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, :price, :size, presence: true
  has_one_attached :photo
end
