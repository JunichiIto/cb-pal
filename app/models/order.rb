class Order < ActiveRecord::Base
  has_many :orders
  attr_accessible :customer_name
end
