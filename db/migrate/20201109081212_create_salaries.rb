class CreateSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :salaries do |t|
      t.integer     :salary,  null: false
      t.references  :user,    foreign_key: true

      t.timestamps
    end
  end
end
