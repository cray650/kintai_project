FactoryBot.define do
  factory :time_card do
    year    { '2020'}
    month   {'11'}
    day     {'11'}
    #in      {Faker::Time.forward(days: 23, period: :morning) }
    out     {Faker::Time.forward(days: 23, period: :morning) }
    user_id {'999'}
  end
end
