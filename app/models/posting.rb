class Posting < ApplicationRecord
    
    validates :title, presence: true
    has_rich_text :body

  has_many :comments, as: :commentable
end
