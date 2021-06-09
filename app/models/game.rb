class Game < ApplicationRecord
  has_many :rankings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :image_url, ImageUploader
end
