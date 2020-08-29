class Product < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image

  #価格が300~999999以内で登録できるようにする
  validates :price, :numericality => { :greater_than_or_equal_to => 300 }  # 価格が300以上であるか
  validates :price, :numericality => { :less_than_or_equal_to => 9999999}     # 数字が9999999以下であるか

  #空の投稿を保存できないようにする
  validates :name, :text, :price, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :burden_id, :area_id, :day_id,  numericality: { other_than: 0 } 
end
