class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shoes, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rentals_as_owner, through: :shoes, source: :rentals, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  has_one_attached :photo
end
