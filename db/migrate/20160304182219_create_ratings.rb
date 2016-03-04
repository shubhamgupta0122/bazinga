class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

    	t.references :user, index: true, foreign_key: true
    	t.references :blog_post, index: true, foreign_key: true
    	t.float :rating

      t.timestamps null: false
    end
  end
end
