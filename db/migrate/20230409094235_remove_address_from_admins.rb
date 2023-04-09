class RemoveAddressFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :address, :string
  end
end
