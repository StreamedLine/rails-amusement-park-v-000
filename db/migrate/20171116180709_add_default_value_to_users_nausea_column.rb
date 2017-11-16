class AddDefaultValueToUsersNauseaColumn < ActiveRecord::Migration
  def change
  	change_column_default :users, :nausea, 0
  end
end
