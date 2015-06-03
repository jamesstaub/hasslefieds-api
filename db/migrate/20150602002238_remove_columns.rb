class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :users, :last_name
  end
end

