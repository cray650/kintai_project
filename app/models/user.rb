class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :time_cards, dependent:  :destroy
  has_many :requests,   dependent:  :destroy

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze

  with_options presence: true do
    validates :employee_id, format: { with: /\A[0-9]+\z/, message: 'IDは半角数字で入力してください' },  uniqueness: true
    validates :firstname,   format: { with: VALID_NAME_REGEX, message: 'は全角かなで入力してください' }
    validates :lastname,    format: { with: VALID_NAME_REGEX, message: 'は全角かなで入力してください' }
    validates :email,       uniqueness: true
    validates :password,    format: { with: /\A[a-zA-Z0-9]+\z/.freeze, message: 'には英字と数字の両方を含めて設定してください' }
    validates :salary,      format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end
end
