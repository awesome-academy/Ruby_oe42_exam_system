FactoryBot.define do
  factory :exam do
    user {user}
    subject {subject}
    description {Faker::Lorem.sentence(word_count: 5)}
  end
end
