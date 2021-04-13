class Memo < ApplicationRecord
  belongs_to :picture
  has_one_attached :image
end
