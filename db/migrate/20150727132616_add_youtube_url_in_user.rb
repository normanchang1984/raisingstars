class AddYoutubeUrlInUser < ActiveRecord::Migration
  def change
    add_column :proposals, :youtube_url, :string
    add_column :proposals, :target, :integer
    add_column :proposals, :progress, :integer
    add_column :proposals, :status, :boolean
    add_column :users, :fb_avatar_url, :string
    add_column :users, :default_avatar_url, :string
  end
end
