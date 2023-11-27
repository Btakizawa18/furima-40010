class Item < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :user
end
