class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :has_weapon
      t.boolean :is_hungry
      t.boolean :is_alone

      t.timestamps
    end
  end
end
