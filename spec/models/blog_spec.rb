require 'rails_helper'

RSpec.describe Blog, type: :model do

  before do
    @user = create(:user)
  end

  it "ブログが作成成功" do
    Blog.create(title: 'あああ', content: 'あいうえお', user_id: @user.id)
    Blog.create(title: 'abcde', content: '', user_id: @user.id)
    expect(Blog.all.count).to eq 2
  end

  it "ブログが作成失敗" do
    Blog.create(title: '', content: 'あいうえお', user_id: @user.id)
    Blog.create(title: [*1..100].join, content: '', user_id: @user.id)
    Blog.create(title: 'タイトル', content: 'あいうえお', user_id: '')
    expect(Blog.all.count).to eq 0
  end

  it "ブログ内容編集" do
    Blog.create(title: 'あああああ', content: 'あいうえお', user_id: @user.id)
    last = Blog.last
    last.update(title: 'ブログ編集', content: 'あばばばば', user_id: @user.id)
    expect(last).to be_valid
  end

end
