class RemoveNicknameFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :nickname, :string
  end
end
