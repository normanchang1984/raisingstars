class AddMissinsIndexAndColumn < ActiveRecord::Migration
  def change
    add_index :userproposalships, :user_id
    add_index :userproposalships, :proposal_id
  end
end
