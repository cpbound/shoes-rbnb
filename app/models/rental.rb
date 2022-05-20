class Rental < ApplicationRecord
  belongs_to :shoe
  belongs_to :user
  enum status: [ :pending, :confirmed, :declined ]
  validates :start_date, :end_date, presence: true

  def formatted_start_date
    start_date.strftime('%b %d')
  end

  def formatted_end_date
    end_date.strftime('%b %d')
  end

  def days
    (end_date - start_date).to_i
  end

  def total_price
    (shoe.price * days).round
  end
end
