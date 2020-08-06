class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
        #　ここから
        t.string :image, null: false
        t.references :post, foreign_key: true, null: false
        #　ここまで
        t.timestamps
    end
  end
end
