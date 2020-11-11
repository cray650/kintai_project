FactoryBot.define do
  factory :user do
        employee_id             {Faker::Number.decimal_part(digits: 2)}
        firstname               {Faker::Name.first_name}
        lastname                {Faker::Name.lase_name}
        email                   {Faker::Internet.email}
        password                {"1111aa"}
        password_confirmation   {password}
  end
end
