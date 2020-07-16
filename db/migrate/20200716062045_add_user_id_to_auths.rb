class AddUserIdToAuths < ActiveRecord::Migration[6.0]
  def change
    add_reference :auths, :user, foreign_key: true
  end
end
