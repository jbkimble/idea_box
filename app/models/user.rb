class User < ActiveRecord::Base
  has_secure_password
  validates_confirmation_of :password

  validates :name, presence: true
  has_many :ideas
end
