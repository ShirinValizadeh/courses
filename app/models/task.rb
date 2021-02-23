class Task < ApplicationRecord
    belongs_to :user
    belongs_to :assignee, class_name: "User"
    has_rich_text :body

end
