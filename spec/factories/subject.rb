FactoryBot.define do
  factory :subject do
    name {Faker::Educator.subject}
    description {Faker::Lorem.sentence(word_count: 20)}
    user {user}
  end
end
