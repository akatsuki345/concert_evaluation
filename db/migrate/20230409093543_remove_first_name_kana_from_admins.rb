class RemoveFirstNameKanaFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :first_name_kana, :string
  end
end
