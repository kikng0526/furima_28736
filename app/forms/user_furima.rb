class UserFurima
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address_line, :building_name, :phone_number, :user_id, :product_id, :token

  validates :token, :city, :address_line, presence: true

  with_options presence: true do
    # 郵便番号は000-0000の形とする。
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    # ジャンルの選択が「--」の時は保存できないようにする
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    # 電話番号は半角数字で11桁以内
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
  end

  def save
    # 商品の情報
    management = Management.create(product_id: product_id, user_id: user_id)
    # 住所の情報
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, management_id: management.id)
  end
end
