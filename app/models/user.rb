class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shoes, dependent: :destroy
  has_many :rentals
  has_many :rentals_as_owner, through: :shoes, source: :rentals
  validates :email, presence: true, uniqueness: true
end
