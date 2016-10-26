class Image < ActiveRecord::Base
  validates :url, presence: true

  has_many :ideas_images
end
