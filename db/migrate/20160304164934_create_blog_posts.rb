class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.string :author
      t.float :rating
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
