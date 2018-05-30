class Destination < ActiveRecord::Base
  belongs_to :motorcycle
  validates :name, presence: true
end
