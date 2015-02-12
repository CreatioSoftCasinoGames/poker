class AddFieldsUsers < ActiveRecord::Migration
  def change
  	add_column :users, :shootout_win, :integer, default: 0
  	add_column :users, :sitandgo_win, :integer, default: 0
  	add_column :users, :best_hand_cards, :text
  end
end
