class AddPointsToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :points, :integer
  end
end
