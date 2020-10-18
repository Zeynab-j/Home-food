class Post < ApplicationRecord
    belongs_to :user
    belongs_to :blog
    has_many :comments, dependent: :destroy

    mount_uploader :image, ImageUploader
end
