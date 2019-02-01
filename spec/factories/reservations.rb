FactoryBot.define do
  factory :reservation do
    start_date { "2019-02-01 16:41:39" }
    end_date { "2019-02-01 16:41:39" }
    listing { nil }
    user { nil }
  end
end
