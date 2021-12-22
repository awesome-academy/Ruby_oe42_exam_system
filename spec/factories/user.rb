FactoryBot.define do
  factory :user, aliases: [:suppervisor] do
    name {Faker::Name.name}
    email {Faker::Internet.safe_email}
    password {"password"}
    password_confirmation {"password"}
    role {"suppervisor"}
  end
end
