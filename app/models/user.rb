class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :bikes, dependent: :destroy
  has_many :favorites, dependent: :destroy
         
  has_one_attached :user_image
  
  validates :name, presence:true, uniqueness:true, length:{ minimum: 2, maximum: 20}
  validates :introduction, length:{ maximum: 50 }
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def get_user_image(width, height)
  unless user_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    user_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
  end
  user_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
         
end
