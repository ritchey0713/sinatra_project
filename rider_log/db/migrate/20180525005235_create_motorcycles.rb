class CreateMotorcycles < ActiveRecord::Migration
  def change
    create_table :motorcycles do |motorcycle|
      motorcycle.string :name 
      motorcycle.integer :rider_id
      end
  end
end
