class MakeUsersAJoinTable < ActiveRecord::Migration
  def up
    add_column :users, :post_id, :integer

  end

  def down
    remove_column :users, :post_id, :integer
  end
end
