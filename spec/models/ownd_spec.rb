require 'rails_helper'

RSpec.describe Ownd, type: :model do

  before do
    @user = create(:user)
    @package = create(:package)
  end

  it '所持が作成成功' do
    Ownd.create(user_id: @user.id, package_id: @package.id)
    Ownd.create(user_id: @user.id, package_id: @package.id)
    expect(Ownd.all.count).to eq 2
  end
end
