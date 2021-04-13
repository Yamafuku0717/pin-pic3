require 'rails_helper'

RSpec.describe Picture, type: :model do
  before do
    @picture = FactoryBot.build(:picture)
  end

  describe '新規投稿' do
    context '新規投稿できるとき' do
      it 'textとimageとpublic_privateが存在していれば投稿できること' do
        expect(@picture).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'textが存在していなければ投稿できない' do
        @picture.text = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが存在していなければ投稿できない' do
        @picture.image = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Image can't be blank")
      end
      it 'public_privateが存在していなければ登録できない' do
        @picture.public_private = ''
        @picture.valid?
        expect(@picture.errors.full_messages).to include("Public private can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @picture.user = nil
        @picture.valid?
        expect(@picture.errors.full_messages).to include("User must exist")
      end
    end
  end
end
