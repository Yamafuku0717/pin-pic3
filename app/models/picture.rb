class Picture < ApplicationRecord
  has_many :memos, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  
  validates :image, presence: true
  validates :text, presence: true
end
