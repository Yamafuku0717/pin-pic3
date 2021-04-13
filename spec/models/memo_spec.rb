require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe '新規メモ投稿' do
    context '新規メモ投稿できるとき' do
      it 'ofsetXとofsetYが存在していれば投稿できること' do
        expect(@memo).to be_valid
      end
      it 'infoが空でも投稿できること' do
        @memo.info = ''
        expect(@memo).to be_valid
      end
      it 'imageが空でも投稿できること' do
        @memo.image = nil
        expect(@memo).to be_valid
      end
    end
    context '新規メモ投稿できないとき' do
      it 'offsetXが空では投稿できないこと' do
        @memo.offsetX = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Offsetx can't be blank")
      end
      it 'offsetYが空では投稿できないこと' do
        @memo.offsetY = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Offsety can't be blank")
      end
      it 'pictureが紐付いていないと保存できないこと' do
        @memo.picture = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Picture must exist")
      end
    end
  end
end
