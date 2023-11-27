class Item < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :user
  has_one_attached :image
end
