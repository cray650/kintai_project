FactoryBot.define do
  factory :time_card do
    year    { '2020'}
    month   {'11'}
    day     {'11'}
    # {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    out     {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end
