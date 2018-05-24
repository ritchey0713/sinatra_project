class Motorcycle < ActiveRecord::Base
  has_many :destinations 
  belongs_to :rider 
end 