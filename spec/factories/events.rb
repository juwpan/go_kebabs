FactoryBot.define do
  factory :event do
    association :user

    title { "Эвент_#{rand(999)}" }
    description { "test _#{rand(999)}" }
    address { "Колхозная_#{rand(999)}" }

    datetime { Time.now }
  end
end
