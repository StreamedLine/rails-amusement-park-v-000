class AddDefaultValueToUsersHeightColumn < ActiveRecord::Migration
  def change
  	change_column_default :users, :height, 0
  end
end
