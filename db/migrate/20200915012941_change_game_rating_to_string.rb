class ChangeGameRatingToString < ActiveRecord::Migration
  def change
    change_column :games, :rating, :text
  end
end
