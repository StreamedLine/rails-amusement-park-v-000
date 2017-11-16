class AddDefaultValueToUsersTicketsColumn < ActiveRecord::Migration
  def change
  	change_column_default :users, :tickets, 0
  end
end
