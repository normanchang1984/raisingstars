class AddImageForProposalAndUser < ActiveRecord::Migration
  def change
    add_attachment :users, :avatar_graph_url
    add_attachment :proposals, :title_graph_url
  end
end
