class Shoe < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  validates :name, :price, :size, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_color_and_category_and_size,
    against: [ :color, :category, :size ],
    using: {
      tsearch: { prefix: true }
    }
end
