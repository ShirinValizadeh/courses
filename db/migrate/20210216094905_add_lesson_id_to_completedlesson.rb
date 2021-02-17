class AddLessonIdToCompletedlesson < ActiveRecord::Migration[6.1]
  def change
    add_column :completedlessons, :lesson_id, :integer
  end
end
