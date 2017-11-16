class AddDefaultValueToUsersHappinessColumn < ActiveRecord::Migration
  def change
  	change_column_default :users, :happiness, 0
  end
end
