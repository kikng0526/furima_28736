require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    user = FactoryBot.create(:user)

    @product = FactoryBot.build(:product, user_id: user.id)
    @product.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '登録できない時' do
    it 'nameが空だと登録できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空だと登録できない' do
      @product.text = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Text can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @product.category_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 0')
    end

    it 'status_idが空だと登録できない' do
      @product.status_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Status must be other than 0')
    end

    it 'bueden_idが空だと登録できない' do
      @product.burden_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Burden must be other than 0')
    end

    it 'area_idが空だと登録できない' do
      @product.area_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Area must be other than 0')
    end

    it 'day_idが空だと登録できない' do
      @product.day_id = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Day must be other than 0')
    end

    it 'imageが空だと登録できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it 'priceが300以下だと登録できない' do
      @product.price = 0
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999以上だと登録できない' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end

  context '登録がうまくいく時' do
    it '必要な情報が全て存在すれば登録できる' do
      expect(@product).to be_valid
    end
  end
end
