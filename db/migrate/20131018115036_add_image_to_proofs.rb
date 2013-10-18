class AddImageToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :image, :string
  end
end
