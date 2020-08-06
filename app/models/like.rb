class Like < ApplicationRecord
    belongs_to :user
    # ここから
    belongs_to :post
    # ここまで追加
end