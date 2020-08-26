class Product < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category, :status, :burden, :area, :day

  #空の投稿を保存できないようにする
  validates :name, :text, :price, :category, :status, :burden, :area, :day, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :burden_id, :area_id, :day_id,  numericality: { other_than: 1 } 
end
