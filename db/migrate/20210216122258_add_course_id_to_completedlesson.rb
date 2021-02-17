class AddCourseIdToCompletedlesson < ActiveRecord::Migration[6.1]
  def change
    add_column :completedlessons, :course_id, :integer
  end
end
