class AddPotAndFeeInTableConfigs < ActiveRecord::Migration
  def change
  	add_column :table_configs, :pot, :decimal
  	add_column :table_configs, :fee, :decimal
  end
end
