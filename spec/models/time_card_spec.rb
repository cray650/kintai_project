require 'rails_helper'
describe TimeCard do
  before do
    @time_card = FactoryBot.build(:time_card)
  end

  describe '勤怠簿新規登録' do
    context '新規登録がうまくいくとき' do
      it "year, month, day, in, outが存在すれば登録できる" do
        expect(@time_card).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "yearが空であれば保存できない" do
        @time_card.year = ''
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include("Year can't be blank")
      end
      it "yearが半角数字以外であれば保存できない" do
        @time_card.year = 'aaaa'
        @time_card.valid?
        expect(@time_card.errors.full_messages).to include("Year ")
      end
      it "yearが2020年以前であれば保存できない" do
      end
      it "monthが空であれば保存できない" do
      end
      it "monthが半角数字以外であれば保存できない" do
      end
      it "monthが12以上であれば保存できない" do
      end
      it "dayが空であれば保存できない" do
      end
      it "dayが半角数字以外であれば保存できない" do
      end
      it "dayが31以上であれば保存できない" do
      end
      it "inが空であれば保存できない" do
      end
      it "outが空であれば保存できない" do
      end
    end
  end
end
