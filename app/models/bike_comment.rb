class BikeComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :bike
  
  validates :comment, presence: true, length:{maximum:200}
  
end
