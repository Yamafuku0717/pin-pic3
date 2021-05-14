class Picture < ApplicationRecord
  has_many :memos, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  
  validates :text, presence: { message: 'が入力されていません' }
  validates :image, presence: { message: 'が選択されていません' }
  validates :public_private, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
