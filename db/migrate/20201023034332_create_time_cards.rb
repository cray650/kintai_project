class CreateTimeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :time_cards do |t|
      t.integer     :year,     null: false
      t.integer     :month,    null: false
      t.integer     :day,      null: false
      t.datetime    :in
      t.datetime    :out

      t.references  :user,     foreign_key: true
      t.references  :request,  foreign_key: true

      t.timestamps
    end
  end
end
