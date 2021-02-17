class CreateCompletedlessons < ActiveRecord::Migration[6.1]
  def change
    create_table :completedlessons do |t|

      t.timestamps
    end
  end
end
