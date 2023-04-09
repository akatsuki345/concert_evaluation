class RemoveLastNameKanaFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :last_name_kana, :string
  end
end
