class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.boolean :allday
      t.string :memo
    t.timestamps
    end
  end
end
