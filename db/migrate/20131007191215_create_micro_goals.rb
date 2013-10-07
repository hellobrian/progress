class CreateMicroGoals < ActiveRecord::Migration
  def change
    create_table :micro_goals do |t|
      t.integer :goal_id
      t.string :title
      t.date :completion_date

      t.timestamps
    end
  end
end
