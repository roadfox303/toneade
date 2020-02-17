# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name { 'テストユーザー' }
    email { "test#{[*1..1000].sample}@gmail.com" }
    password { 'password' }
  end
end
