class Upload < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :recipe

  before_destroy :delete_cloudinary_asset

  def delete_cloudinary_asset
    if self.image?
      Cloudinary::Uploader.destroy(image.my_public_id)
    end
  end
end
