class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false, limit: 200
      t.string :description, null: false, limit: 500
      t.integer :year_released, null: false, limit: 4

      t.timestamps null: false
    end
  end
end
