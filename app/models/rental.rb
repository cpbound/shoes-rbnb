class Rental < ApplicationRecord
  belongs_to :shoe
  belongs_to :user
  enum status: [ :pending, :confirmed, :declined ]
  validates :start_date, :end_date, presence: true
end
