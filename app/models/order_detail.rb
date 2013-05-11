class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :bread
  attr_accessible :quantity

  validates_presence_of :order, :bread, :quantity
end
