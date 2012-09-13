FactoryGirl.define do
  factory :patient do
    name { Faker::Name.name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.postcode }
    phone { Faker::PhoneNumber.phone_number }
  end
end
