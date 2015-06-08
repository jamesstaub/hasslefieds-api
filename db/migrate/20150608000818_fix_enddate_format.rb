class FixEnddateFormat < ActiveRecord::Migration
 def up
    remove_column :posts, :end_date
    add_column :posts, :end_date, :datetime
  end

  def down
    remove_column :posts, :end_date
    add_column :posts, :end_date, :string
  end
end
