class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |rider|
      rider.string :name
      rider.string :password_digest 
    end 
  end
end
