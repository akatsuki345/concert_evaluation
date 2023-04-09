class RemovePostalCodeFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :postal_code, :string
  end
end
