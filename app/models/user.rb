class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :first_kana, :last_name, :last_kana, :date, presence: true

  # before_save { self.email = email.downcase }

  # # emailに対して一意性制約をかける
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  # 本名を全角指定
  VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :first_name, { presence: true, format: { with: VALID_FIRST_NAME_REGEX } }

  VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, { presence: true, format: { with: VALID_LAST_NAME_REGEX } }

  # フリガナ全角カタカナ指定
  VALID_FIRST_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :first_kana, { presence: true, format: { with: VALID_FIRST_KANA_REGEX } }

  VALID_LAST_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_kana, { presence: true, format: { with: VALID_LAST_KANA_REGEX } }

  #  #password半角英数字混合指定
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, { presence: true, format: { with: VALID_PASSWORD_REGEX } }
end
