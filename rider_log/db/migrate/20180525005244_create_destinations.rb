class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations |destination|
    destination.string :name 
    destination.integer :distance 
    destination.integer :motorcycle_id
    end 
  end
end
