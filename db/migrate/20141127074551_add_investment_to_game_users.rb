class AddInvestmentToGameUsers < ActiveRecord::Migration
  def change
  	add_column :game_users, :investment, :decimal
  end
end
