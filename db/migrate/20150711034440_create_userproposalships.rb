class CreateUserproposalships < ActiveRecord::Migration
  def change
    create_table :userproposalships do |t|
      t.integer :proposal_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
