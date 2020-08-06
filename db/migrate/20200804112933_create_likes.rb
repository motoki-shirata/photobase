class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      # ここから
      t.references :post,
      foreign_key: true,
      null: false 
      t.references :user,
      foreign_key: true, 
      null: false 
      # ここまで追加
      t.timestamps
    end
  end
end
