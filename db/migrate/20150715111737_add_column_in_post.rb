class AddColumnInPost < ActiveRecord::Migration
  def change
    add_column :proposals, :views, :integer
  end
end
