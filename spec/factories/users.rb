FactoryBot.define do
  factory :user do
    name { "Ебаря_Гиёма_де_Ломарк_#{rand(999)}" }
    sequence(:email) { |n| "juwpan#{n}@gmail.com" }
    after(:build) { |u| u.password_confirmation = u.password = "1"}
  end
end
