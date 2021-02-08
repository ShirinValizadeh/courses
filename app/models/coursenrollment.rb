# frozen_string_literal: true

class Coursenrollment < ApplicationRecord
  belongs_to :course
  belongs_to :user
end
