class Console < ActiveRecord::Base
  has_many :games
  belongs_to :user
  

end
