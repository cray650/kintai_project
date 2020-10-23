class CreateTimeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :time_cards do |t|
      t.integer :year,          null: false
      t.integer :month,         null: false
      t.integer :day,           null: false
      t.datetime :in,           null: false
      t.datetime :out,          null: false

      t.references :user,       foreign_key: true

      t.timestamps
    end
  end
end
