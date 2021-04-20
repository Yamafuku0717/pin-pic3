class Picture < ApplicationRecord
  has_many :memos, dependent: :destroy
  has_many :favorites
  belongs_to :user
  has_one_attached :image
  
  validates :image, presence: true
  validates :text, presence: true
  validates :public_private, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
