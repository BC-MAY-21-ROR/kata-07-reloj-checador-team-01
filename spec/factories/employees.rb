FactoryBot.define do
  factory :employee do
    user
    name{Faker::Name.name}
    email{Faker::Internet.email}
    private_number{Faker::Number.number(digits: 5)}
  end
end
