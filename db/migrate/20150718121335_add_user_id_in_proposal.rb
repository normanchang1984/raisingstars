class AddUserIdInProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :user_id, :integer
    add_index :proposals, :user_id
    add_index :comments, :proposal_id
  end
end
