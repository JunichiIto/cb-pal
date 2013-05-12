class Order < ActiveRecord::Base
  has_many :order_details
  attr_accessor :bread_quantities
  attr_accessible :customer_name, :bread_quantities

  before_save :create_details
  def create_details
    return if bread_quantities.empty?
    bread_quantities.select{|_, qty| qty.to_f > 0.0}.each do |bread_id, quantity|
      bread = Bread.find bread_id
      detail = self.order_details.build
      detail.bread = bread
      detail.quantity = quantity.to_f
    end
  end
end
