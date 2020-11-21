require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'example_id,firstname,lastname,email、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ半角英数字混合であれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'example_idが空だと登録できない' do
        @user.employee_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee can't be blank", 'Employee IDは半角数字で入力してください')
      end
      it 'example_idが半角数字以外だと登録できない' do
        @user.employee_id = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'sample.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emialは一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'firstnameが空だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角かな以外だと登録できない' do
        @user.firstname = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname は全角かなで入力してください')
      end
      it 'lastnameが空だと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角かな以外だと登録できない' do
        @user.lastname = 'aiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname は全角かなで入力してください')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下であれば登録できない' do
        @user.password = ' 1111a'
        @user.password_confirmation = '1111a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '1111aa'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
