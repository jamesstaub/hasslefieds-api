class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :start_date
      t.string :end_date
      t.string :category
      t.string :price
      t.string :condition
      t.string :topic

      t.timestamps null: false
    end
  end
end
