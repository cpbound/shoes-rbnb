class Shoe < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, presence: true
end
