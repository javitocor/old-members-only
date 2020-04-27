class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum:5, maximum:25}
    validates :content, presence: true, length: {minimum:25, maximum:500}
    validates :user_id, presence: true
end
