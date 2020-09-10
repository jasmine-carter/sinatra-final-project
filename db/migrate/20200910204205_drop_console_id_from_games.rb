class DropConsoleIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :console_id, :integer
  end
end
