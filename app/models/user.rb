class User < ApplicationRecord
    has_many :posts
    has_many :blogs, through: :posts 
end
