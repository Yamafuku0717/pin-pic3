class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: { maximum: 8 }
  has_many :pictures, dependent: :destroy
  has_many :favorites
  has_many :favorite_pictures, through: :favorites, source: :tweet
  has_one_attached :image
  has_many :my_lists, dependent: :destroy
end
