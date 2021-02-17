class Completedlesson < ApplicationRecord

    belongs_to :lesson
    belongs_to :user
    belongs_to :course



end
