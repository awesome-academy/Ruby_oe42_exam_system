FactoryBot.define do
  factory :question do
    name {Faker::Name.name}
    user {user}
  end
end
