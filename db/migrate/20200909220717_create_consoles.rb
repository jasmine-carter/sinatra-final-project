class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.string :name
      t.integer :user_id
      t.integer :year_released
      t.integer :year_purchased
      t.timestamps null: false
    end
  end
end
