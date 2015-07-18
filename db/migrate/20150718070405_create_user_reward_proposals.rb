class CreateUserRewardProposals < ActiveRecord::Migration
  def change
    create_table :user_reward_proposals do |t|
      t.integer :proposal_id
      t.integer :reward_id

      t.timestamps null: false
    end
  end
end
