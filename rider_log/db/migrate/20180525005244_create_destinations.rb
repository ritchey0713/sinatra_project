class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |destination|
    destination.string :name 
    destination.integer :distance 
    destination.integer :motorcycle_id
    end 
  end
end
