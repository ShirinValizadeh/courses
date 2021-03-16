# frozen_string_literal: true

class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :coursenrollments, dependent: :destroy
  has_many :course_ratings
  has_one_attached :image

  has_rich_text :body

  validates :title, presence: true
  validates :description, length: { maximum: 200 }
 # validates :publish, presence: false

  delegate :count, to: :lessons, prefix: true

  def enrolled?(current_user)
    coursenrollments.find_by(user: current_user)
  end

  def next_lesson(lesson)
    index = lessons.find_index { |l| l.id == lesson.id }
    lessons[index + 1]
  end

  #last_lesson
  def last_lesson?(lesson)
    index = lessons.find_index { |l| l.id == lesson.id }
    index == lessons.count-1
  end

  def previous_lesson(lesson)
    index = lessons.find_index { |l| l.id == lesson.id }
    lessons[index - 1]
  end


  def progress_for(user)
    total_lessons_count = lessons.count
    completed_lessons_count = Completedlesson.where(course: self, user: user).count
    number = ((completed_lessons_count.to_f / total_lessons_count.to_f) * 100.0).to_i
    [number, 100].min

  end



  def average_rating
    course_ratings.all.average(:rating).to_i    
  end

  def average_rating_empty
  5 -   course_ratings.all.average(:rating).to_i  
  end
end
