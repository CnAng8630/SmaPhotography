class PostPhoto < ApplicationRecord
  belongs_to :user

  has_one_attached :photo_image

  def get_photo_image(width, height)
    photo_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :photo_image, presence: true
  validates :type_name, presence: true, length: {maximum: 20}
  validates :introduction, presence: true, length: {maximum: 50}
end
