require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do
  background do
    # @other_user = FactoryBot.create(:user)
    visit new_user_registration_path
    fill_in "user_name", with: "テストユーザーA"
    fill_in "user_email", with: "testa@gmail.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
  end

  scenario "ユーザー登録" do
    expect(page.assert_text('テストユーザーA')).to be true
  end

  scenario "ユーザー名変更" do
    click_on 'Profile'
    fill_in 'user_name', with:'テストユーザーB'
    fill_in "user_current_password", with: "password"
    click_button "Update"
    click_on 'マイページ'
    expect(page.assert_text('テストユーザーB')).to be true
  end

end
