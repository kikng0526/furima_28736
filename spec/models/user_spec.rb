require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録がうまくいかない時' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性でないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは@を含まれていないと登録できない' do
      @user.email = 'aaaa.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以上ではないと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは半角英数字混合ではないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_kanaが空だと登録できない' do
      @user.first_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end

    it 'Last_kanaが空だと登録できない' do
      @user.last_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end

    it '本名は全角以外では登録できない' do
      @user.first_name = 'aaaa'
      @user.last_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid', 'Last name is invalid')
    end

    it 'フリガナは全角カタカナ以外では登録できない' do
      @user.first_kana = 'aaaa'
      @user.last_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana is invalid', 'Last kana is invalid')
    end

    it '生年月日がからだと登録できない' do
      @user.date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end

  context '登録がうまくいく時' do

    it '必要な情報が全て存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
end
