# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  has_many  :completedlessons

  validates :title, presence: true
end
