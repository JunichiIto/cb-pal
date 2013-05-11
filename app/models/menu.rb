class Menu < ActiveRecord::Base
  belongs_to :bread
  attr_accessible :quantity
end
