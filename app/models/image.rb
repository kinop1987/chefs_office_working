class Image < ApplicationRecord
  mount_uploader :name, ImageUploader
  belongs_to :cooking, optional: true
end
