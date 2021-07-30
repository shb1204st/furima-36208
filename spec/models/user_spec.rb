require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'emailが重複していると登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@がなければ登録できないこと' do
        @user.email = 'test.example'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      # it 'passwordが6文字以上であれば登録できること' do
      #   @user.password = '123456'
      #   @user.password_confirmation = '123456'
      #   expect(@user).to be_valid
      # end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードは半角英数字で入力してください')
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字で入力してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '0000000a'
        @user.password_confirmation = '000000a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.first_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角の漢字もしくはひらがなもしくはカタカナで入力してください')
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
        @user.last_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角の漢字もしくはひらがなもしくはカタカナで入力してください')
      end

      it 'kana_first_nameが空では登録できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("カタカナでの名前を入力してください", "カタカナでの名前は全角のカタカナで入力してください")
      end

      it 'kana_last_nameが空では登録できないこと' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("カタカナでの苗字を入力してください", "カタカナでの苗字は全角のカタカナで入力してください")
      end

      it 'kana_first_nameが全角（カタカナ）でなければ登録できないこと' do
        @user.kana_first_name = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナでの名前は全角のカタカナで入力してください')
      end

      it 'kana_last_nameが全角（カタカナ）でなければ登録できないこと' do
        @user.kana_last_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('カタカナでの苗字は全角のカタカナで入力してください')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
