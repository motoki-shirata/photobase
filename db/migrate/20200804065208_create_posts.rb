class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t| #　ここから
      t.references :user, 
      foreign_key: true, 
      null: false
      t.string :caption
      #　ここまで 
      t.timestamps
    end
  end
end