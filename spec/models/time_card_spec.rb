require 'rails_helper'
describe TimeCard do
  before do
    @time_card = FactoryBot.build(:time_card)
  end

  describe '勤怠簿新規登録' do
    context '新規登録がうまくいくとき' do
      it 'year, month, day, in, outが存在すれば登録できる' do
        expect(@time_card).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'yearが空であれば保存できない' do
        @time_card.year = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include("Year can't be blank")
      end
      it 'yearが半角数字以外であれば保存できない' do
        @time_card.year = 'aaaa'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Year is not a number')
      end
      it 'yearが2020年以前であれば保存できない' do
        @time_card.year = '2019'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Year must be greater than or equal to 2020')
      end
      it 'monthが空であれば保存できない' do
        @time_card.month = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include("Month can't be blank", 'Month 半角数字を使用してください。', 'Month is not a number')
      end
      it 'monthが半角数字以外であれば保存できない' do
        @time_card.month = 'aa'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Month is not a number')
      end
      it 'monthが12以上であれば保存できない' do
        @time_card.month = '20'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Month must be less than or equal to 12')
      end
      it 'dayが空であれば保存できない' do
        @time_card.day = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include("Day can't be blank", 'Day 半角数字を使用してください。', 'Day is not a number')
      end
      it 'dayが半角数字以外であれば保存できない' do
        @time_card.day = 'aaa'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Day is not a number')
      end
      it 'dayが31以上であれば保存できない' do
        @time_card.day = '40'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include('Day must be less than or equal to 31')
      end
      it 'inが空であれば保存できない' do
        @time_card.in = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include
      end
      it 'outが空であれば保存できない' do
        @time_card.out = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include
      end
    end
  end
end
