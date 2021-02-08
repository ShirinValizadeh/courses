# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :course

  validates :title, presence: true
end
