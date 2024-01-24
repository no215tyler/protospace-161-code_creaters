class Prototype < ApplicationRecord
  has_one_attached :image
  
  validates :title, :catch_copy, :concept,  presence: true
  
  def was_attached?
    self.image.attached?
  end

end
