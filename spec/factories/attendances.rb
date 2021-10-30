FactoryBot.define do
  factory :attendance do
    employee
    check_in { Time.current }
    check_out{Time.current + 2.hours}
    
  end
end
