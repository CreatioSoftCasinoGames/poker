class ChangeDaimondsChipsLevelDefaults < ActiveRecord::Migration

  def up
  	change_column_default :users, :level, 1
  	change_column_default :users, :diamonds, 100
  	change_column_default :users, :chips, 10000
  end

  def down
  	change_column_default :users, :level, 0
  	change_column_default :users, :diamonds, 0
  	change_column_default :users, :chips, nil
  end

end
