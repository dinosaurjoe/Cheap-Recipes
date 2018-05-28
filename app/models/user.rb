class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :profile_picture, ImageUploader

  has_many :recipes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
