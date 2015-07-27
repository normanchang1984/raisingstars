class AddYoutubeUrlInUser < ActiveRecord::Migration
  def change
    add_column :proposals, :youtube_url, :string
  end
end
