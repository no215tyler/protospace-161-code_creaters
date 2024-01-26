class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :catch_copy, :concept, presence: true

  def was_attached?
    image.attached?
  end
end
