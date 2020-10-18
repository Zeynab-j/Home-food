class Blog < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :users, through: :posts

    validates_presence_of :category
end
