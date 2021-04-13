class Memo < ApplicationRecord
  belongs_to :picture
  has_one_attached :image

  validates :offsetX, presence: true
  validates :offsetY, presence: true
end
