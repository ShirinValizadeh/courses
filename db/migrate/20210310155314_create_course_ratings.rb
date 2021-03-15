class CreateCourseRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :course_ratings do |t|
      t.integer :course_id
      t.integer :rating

      t.timestamps
    end
  end
end
