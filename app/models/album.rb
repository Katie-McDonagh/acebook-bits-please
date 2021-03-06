class Album < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  validates :title, presence: true
  validate :image_type

  def thumbnail input
    return self.images[input].variant(resize: '200x200!').processed
  end

  private

  def image_type
    if images.attached? == false
      errors.add(:images, "are missing!")
    end

    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'needs to be a JPEG or PNG')
      end
    end
  end

end
