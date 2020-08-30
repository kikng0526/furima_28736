class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :first_kana, :last_name, :last_kana, :date, presence: true

  has_many :products
  has_one :management

  # 本名を全角指定
  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :first_name, { presence: true, format: { with: VALID_FIRST_NAME_REGEX } }

  VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :last_name, { presence: true, format: { with: VALID_LAST_NAME_REGEX } }

  # フリガナ全角カタカナ指定
  VALID_FIRST_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :first_kana, { presence: true, format: { with: VALID_FIRST_KANA_REGEX } }

  VALID_LAST_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :last_kana, { presence: true, format: { with: VALID_LAST_KANA_REGEX } }

  #  #password半角英数字混合指定
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, { presence: true, format: { with: VALID_PASSWORD_REGEX } }
end
