class Post < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :blog, optional: true
    has_many :comments
end
