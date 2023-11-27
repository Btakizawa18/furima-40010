class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  # active_storageとのアソシエーション
  has_one_attached :image

  # 空では保存できない
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user_id
  end

  # ジャンルの選択が「--」のときは保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
