require 'rails_helper'
describe Request do
  before do
    @request = FactoryBot.build(:request)
  end

  describe '申請登録' do
    context  '申請登録がうまくいくとき' do
      it 'type_id, reasonがあれば保存できる' do
        expect(@request).to be_valid
      end

      it 'type_id, reasonが既に存在するレコードにapprovalを保存することができる' do
        expect().to be_valid
      end
    end

    context '申請登録がうまくいかないとき' do
      it 'type_idがなければ保存できない' do
        @request.type_id = ''
        @request.valid?
        expect(@request.errors.full_messages).to include('')
      end

      it 'type_idが0であれば保存できない' do
        @request.type_id = '0'
        @request.valid?
        expect(@request.errors.full_messages).to include('')
      end

      it 'reasonがなければ保存できない' do
        @request.reason = ''
        @request.valid?
        expect(@request.errors.full_messages).to include('')
      end

      it 'reasonが全角かなでなければ保存できない' do
        @request.reason = 'aiueo'
        @request.valid?
        expect(@request.errors.full_messages).to include('')
      end

      it 'approvalがboolean型以外では保存できない' do
        @request.approval = Faker::Boolean.boolean 
        @request.valid?
        expect(@request.errors.full_messages).to include('')
      end
    end
  end
end

