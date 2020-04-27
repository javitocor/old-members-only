class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
