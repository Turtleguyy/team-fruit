class AddFieldsToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :embed_html, :text
    add_column :videos, :published_at, :datetime
    add_column :videos, :thumbnail_url, :string
    add_column :videos, :title, :string
    add_column :videos, :view_count, :integer
    add_column :videos, :youtube_id, :string
    remove_column :videos, :url, :string
  end
end
