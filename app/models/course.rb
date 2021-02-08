# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  has_many :coursenrollments, dependent: :destroy
  validates :title, presence: true

  validates :description, length: { maximum: 200 }

  delegate :count, to: :lessons, prefix: true

  def enrolled?(current_user)
    coursenrollments.find_by(user: current_user)
  end
end
