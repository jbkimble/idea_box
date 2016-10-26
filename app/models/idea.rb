class Idea < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :category
  belongs_to :user
  has_many :ideas_images
end
