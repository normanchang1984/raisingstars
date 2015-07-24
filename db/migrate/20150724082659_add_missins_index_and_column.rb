class AddMissinsIndexAndColumn < ActiveRecord::Migration
  def change
    add_column :orders, :product_id, :integer
    add_index :orders, :product_id
    add_index :userproposalships, :user_id
    add_index :userproposalships, :proposal_id
  end
end
