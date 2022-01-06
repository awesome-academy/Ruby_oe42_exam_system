FactoryBot.define do
  factory :answer do
    question {question}
    ans {Faker::Emotion.noun}
    content {Faker::Hacker.say_something_smart}
  end
end
