require 'rails_helper'

RSpec.describe Package, type: :model do
  it 'パッケージが作成成功' do
    Package.create(product_id: 'test_1234', category: 'テスト商品', name: 'ピアノ', image: 'https://files.stripe.com/links/fl_test_UvCNebzVhW1NmC89L5AEdfoM', comment: 'コメント')
    Package.create(product_id: 'test_1234', name: 'ピアノ')
    Package.create(product_id: 'test_5678', name: 'サックス')
    expect(Package.all.count).to eq 3
  end

  it 'パッケージが作成失敗' do
    Package.create(product_id: '', name: 'テスト商品')
    Package.create(product_id: 'test_1234', name: '')
    expect(Package.all.count).to eq 0
  end
end
