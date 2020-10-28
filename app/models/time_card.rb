class TimeCard < ApplicationRecord
  belongs_to :user

  with_options presence: true do 
    validates :year
    validates :month
    validates :day
  end
end
