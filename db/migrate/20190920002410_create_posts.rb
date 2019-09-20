class CreatePosts < ActiveRecord::Migration[6.0]
  def up
    create_table :posts do |t|

      t.text :title
      t.text :body
      t.text :author
      t.text :media

      t.timestamps
    end
  end

  def down
    drop_table :posts

  end
end
