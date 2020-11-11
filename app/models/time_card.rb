class TimeCard < ApplicationRecord
  belongs_to :user
  belongs_to :request, optional: true


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください。'} do 
    validates :year,  length: { maximum: 4}, numericality: { greater_than_or_equal_to: 2020 }
    validates :month, length: { maximum: 2}, numericality: { less_than_or_equal_to: 12 }
    validates :day,   length: { maximum: 2}, numericality: { less_than_or_equal_to: 31 }
  end

  def self.today(current_user)
    date = Date.current
    condition = { year: date.year, month: date.month, day: date.day }
    self.find_by(condition) || self.new(condition)
  end

end
