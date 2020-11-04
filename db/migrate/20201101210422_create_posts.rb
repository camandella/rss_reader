class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.datetime :pub_date, null: false
      t.timestamps
    end
    add_index :posts, :link, unique: true
  end
end
