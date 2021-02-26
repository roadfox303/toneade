FactoryBot.define do
  factory :package, class: Package do
    product_id { "test_#{[*1..1000].sample}" }
    name { "pack#{[*1..1000].sample}" }
  end
end
