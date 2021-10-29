FactoryBot.define do
  factory :attendance do
    employee
    check_in{Faker::Time}
    check_out{Faker::Time}
  end
end
