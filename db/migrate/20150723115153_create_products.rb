class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.timestamps null: false
      t.integer :proposal_id
    end
    add_index :products, :proposal_id
  end
end
