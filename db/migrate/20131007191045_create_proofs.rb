class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.integer :micro_goal_id
      t.text :lesson
      t.binary :picture
      t.boolean :completed

      t.timestamps
    end
  end
end
