class Request < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to :user
  has_one :time_card, dependent: :destroy
  accepts_nested_attributes_for :time_card, allow_destroy: true

  with_options presence: true do
    validates :type_id, numericality: { other_than: 1 }
    validates :reason,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  end
end
