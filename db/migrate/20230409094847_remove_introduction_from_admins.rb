class RemoveIntroductionFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :introduction, :text
  end
end
