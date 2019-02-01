FactoryBot.define do
  factory :listing do
    available_beds { 1 }
    price { 1 }
    description { "MyText" }
    has_wifi { false }
    welcome_message { "MyText" }
    user { nil }
    city { nil }
  end
end
