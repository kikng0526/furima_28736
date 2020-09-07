require 'rails_helper'

RSpec.describe UserFurima, type: :model do
    before do
      @user_furima = FactoryBot.build(:user_furima)
    end


    describe '登録できない時' do
     it 'postal_codeが空だと保存できないこと' do
       @user_furima.postal_code = nil
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("Postal code can't be blank")
     end

     it 'postal_codeが000-0000の形ではないと保存できないこと' do
     @user_furima.postal_code = 0000000
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("Postal code is invalid")
     end

     it 'area_idが空だと保存できないこと' do
       @user_furima.area_id = 0
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("Area can't be blank")
     end

     it 'cityが空だと保存できないこと' do
       @user_furima.city = nil
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("City can't be blank")
     end

     it 'address_lineが空だと保存できないこと' do
       @user_furima.address_line = nil
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("Address line can't be blank")
     end

     it 'phone_numberが空だと保存できないこと' do
       @user_furima.phone_number = nil
       @user_furima.valid?
       expect(@user_furima.errors.full_messages).to include("Phone number can't be blank")
     end

     it 'phone_numberが11桁以上だと保存できないこと' do
      @user_furima.phone_number = 111111111111
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it 'phone_numberにハイフンがある場合登録できない' do
      @user_furima.phone_number = 111-1111-1111
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Phone number is invalid")
    end

    it 'tokenが空だと保存できないこと' do
      @user_furima.token = nil
      @user_furima.valid?
      expect(@user_furima.errors.full_messages).to include("Token can't be blank")
    end
   end

   context '登録がうまくいく時' do
    it '必要な情報が全て存在すれば登録できる' do
      expect(@user_furima).to be_valid
    end

    it 'bulding_nameは空でも保存できること' do
      @user_furima.building_name = nil
      expect(@user_furima).to be_valid
    end
  end
end
