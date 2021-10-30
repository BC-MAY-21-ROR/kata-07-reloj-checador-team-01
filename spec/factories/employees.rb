FactoryBot.define do
  factory :employee do
    user
    name{Faker::Name.name}
    email{Faker::Internet.email}
    private_number{Faker::Number.number(digits: 5)}
    after :create do |employee|
      create_list :attendance, 2, employee: employee
    end
  end
  
end
