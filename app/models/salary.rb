class Salary < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :salary, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください。' }
  end
end
