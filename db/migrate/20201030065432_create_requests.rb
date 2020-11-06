class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer     :type_id,   null: false
      t.text        :reason,    null: false
      t.boolean     :approval

      t.references  :user,    null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
