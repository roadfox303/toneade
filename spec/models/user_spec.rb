require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ユーザー登録成功' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@gmail.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'ユーザーネームがないと登録失敗' do
    user = User.new(
      name: '',
      email: 'testaro@gmail.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'ユーザーネームが20文字を超えると失敗' do
    user = User.new(
      name: 'abcdefghijklmnopqrstuvwxyz',
      email: 'testaro@gmail.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'メールアドレスがないと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: '',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'パスワードがないと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@gmail.com',
      password: ''
    )
    expect(user).not_to be_valid
  end

  it 'パスワードが6文字未満だと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@gmail.com',
      password: 'abcde'
    )
    expect(user).not_to be_valid
  end
end
