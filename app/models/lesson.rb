# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course
  has_many  :completedlessons

  has_rich_text :body

  validates :title, presence: true
end
