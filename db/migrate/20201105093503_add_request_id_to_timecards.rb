class AddRequestIdToTimecards < ActiveRecord::Migration[6.0]
  def change
    add_reference :time_cards, :request, foreign_key: true
  end
end
