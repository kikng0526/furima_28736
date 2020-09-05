class UserFurima

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address_line, :building_name, :phone_number, :user_id, :product_id, :token

  # 空の投稿を保存できないようにする
  validates :token, :postal_code, :city, :address_line, :phone_number, presence: true
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  # 郵便番号は000-0000の形とする。
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  #電話番号は11桁以内
  validates :phone_number, length: {maximum: 11}
  
  

  def save
    #商品の情報
    management = Management.create(product_id: product_id, user_id: user_id)
    #住所の情報
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number,  management_id: management.id)
  end
end