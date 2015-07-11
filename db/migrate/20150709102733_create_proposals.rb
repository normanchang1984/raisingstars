class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :project_category_id
      t.text :self_intro
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
