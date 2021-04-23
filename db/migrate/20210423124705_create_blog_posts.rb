class CreateBlogPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.integer :state

      t.timestamps
    end
  end
end
