FactoryBot.define do
  factory :request do
    type_id             {'1'}
    reason              {"体調不良のため"}
    
    association :user
  end
end
