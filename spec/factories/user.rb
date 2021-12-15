FactoryBot.define do
  factory :user, aliases: [:trainee] do
    name {Faker::Name.name}
    email {Faker::Internet.safe_email}
    password {"password"}
    password_confirmation {"password"}
    role {"trainee"}
  end
end
