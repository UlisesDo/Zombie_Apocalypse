class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.float :zombie_probability
      t.float :latitude
      t.float :longitude
      t.boolean :has_weapon
      t.boolean :has_food
      t.boolean :has_people

      t.timestamps
    end
  end
end
