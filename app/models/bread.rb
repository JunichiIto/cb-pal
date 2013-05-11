class Bread < ActiveRecord::Base
  has_one :menu
  validates_presence_of :name
end
