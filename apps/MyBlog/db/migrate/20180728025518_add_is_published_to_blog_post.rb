class AddIsPublishedToBlogPost < ActiveRecord::Migration
  def up
    add_column :blog_posts, :ispublished, :boolean
  end

  def down
    remove_column :blog_posts, :ispublished
  end
end
