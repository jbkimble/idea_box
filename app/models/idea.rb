class Idea < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :category
  belongs_to :user

  has_many :ideas_images
  has_many :images, through: :ideas_images

  def self.sort_by_category
    order(:category_id)
  end

end
