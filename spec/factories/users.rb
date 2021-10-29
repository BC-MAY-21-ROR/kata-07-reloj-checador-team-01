FactoryBot.define do
  factory :user do
    email{Faker::Internet.email}
    password{Faker::Internet.password}

    factory :superadmin_user do
      superadmin_role{true}
      user_role{false}
    end

    factory :regular_user do
      superadmin_role{false}
      user_role{true}
    end
  end
end
