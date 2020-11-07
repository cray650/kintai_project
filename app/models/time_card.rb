class TimeCard < ApplicationRecord
  belongs_to :user
  belongs_to :request, optional: true


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください。'} do 
    validates :year
    validates :month
    validates :day
  end

  def self.today(current_user)
    date = Date.current
    condition = { year: date.year, month: date.month, day: date.day }
    self.find_by(condition) || self.new(condition)
  end

end
