class AddImageForProposalAndUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :string
    add_column :proposals, :title_graph_url, :string
  end
end
