class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.string :reactionable_type
      t.integer :reactionable_id
      t.integer :user_id
      t.integer :reaction

      t.timestamps
    end
  end
end
