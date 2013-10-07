class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :title
      t.text :motivation
      t.date :completion_date

      t.timestamps
    end
  end
end
