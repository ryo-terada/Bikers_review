class Bike < ApplicationRecord

   belongs_to :user

  has_one_attached :bike_image

  def get_bike_image(width, height)
    unless bike_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      bike_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    bike_image.variant(resize_to_limit: [width, height]).processed
  end
end
