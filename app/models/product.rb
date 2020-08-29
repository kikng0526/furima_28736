class Product < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :name, :text, :price, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :burden_id, :area_id, :day_id,  numericality: { other_than: 0 } 
end
