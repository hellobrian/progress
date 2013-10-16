class AddCompletedToMicroGoals < ActiveRecord::Migration
  def change
    add_column :micro_goals, :completed, :boolean
  end
end
