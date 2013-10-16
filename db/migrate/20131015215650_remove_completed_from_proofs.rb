class RemoveCompletedFromProofs < ActiveRecord::Migration
  def up
    remove_column :proofs, :completed
  end

  def down
    add_column :proofs, :completed, :boolean
  end
end
