class RemoveTelephoneNumberFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :telephone_number, :string
  end
end
