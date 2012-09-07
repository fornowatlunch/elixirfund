FactoryGirl.define do
  factory :partner do
    address1 { Faker::Address.street_address }
    address2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.postcode[0..4] }
    sequence(:contact_email) {|n| "partner-#{n}@example.com"}
    contact_name { Faker::Name.name }
    description { Faker::Company.bs.titleize }
    name { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
