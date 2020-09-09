class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :console_id
      t.integer :user_id
      t.string :name
      t.string :review
      t.integer :rating
      t.timestamps null: false
    end
  end
end
