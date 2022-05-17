class Shoe < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, presence: true
  has_one_attached :photo
end
