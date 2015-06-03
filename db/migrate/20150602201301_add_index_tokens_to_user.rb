class AddIndexTokensToUser < ActiveRecord::Migration
  def change
    add_index(:users, :email, unique: true)
    add_index(:users, :token, unique: true)
  end
end
