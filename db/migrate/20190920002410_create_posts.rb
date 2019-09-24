class CreatePosts < ActiveRecord::Migration[6.0]
  def up
    create_table :posts do |t|
      t.belongs_to  :user
      t.text :title
      t.text :body
      t.text :author
      t.text :media
      t.text :public_key

      t.timestamps
    end
  end

  def down
    drop_table :posts

  end
end
