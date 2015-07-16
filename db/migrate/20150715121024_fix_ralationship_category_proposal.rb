class FixRalationshipCategoryProposal < ActiveRecord::Migration
  def change
    remove_column :proposals, :project_category_id
    add_column :proposals, :category_id, :integer
    add_index :proposals, :category_id
  end
end
