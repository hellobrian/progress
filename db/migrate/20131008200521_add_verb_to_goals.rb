class AddVerbToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :verb, :string
  end
end
