FactoryBot.define do
  factory :user do
    employee_id             {Faker::Number.decimal_part(digits: 4)}
    firstname               {Faker::Japanese::Name.first_name}
    lastname                {Faker::Japanese::Name.last_name}
    email                   {Faker::Internet.email}
    password                {'1111aa'}
    password_confirmation   {password}
    salary                  {Faker::Number.within(range: 2000000..10000000)}
  end
end
