class AddImageForProposalAndUser < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar_url
    add_attachment :proposals, :title_graph_url
  end
end
