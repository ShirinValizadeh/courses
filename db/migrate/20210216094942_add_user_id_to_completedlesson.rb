class AddUserIdToCompletedlesson < ActiveRecord::Migration[6.1]
  def change
    add_column :completedlessons, :user_id, :integer
  end
end
