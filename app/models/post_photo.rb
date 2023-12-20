class PostPhoto < ApplicationRecord
  belongs_to :user

  has_one_attached :photo_image

  def get_photo_image(width, height)
    photo_image.variant(resize_to_limit: [width, height]).processed
  end
end
