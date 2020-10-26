class TimeCard < ApplicationRecord
  belongs_to :user

  with_options presence: true do 
    validates :year
    validates :month
    validates :in
    validates :out
  end

  def working_status
    case [!!:in, !!:out]
      when [false, false]
        :not_arrived # 未出社
      when [true, false]
        :working # 勤務中
      when [true, true]
        :left # 退社済
    end
  end
  
end
