class Order < ActiveRecord::Base
  has_many :order_details, dependent: :destroy
  attr_accessor :bread_quantities
  attr_accessible :customer_name, :bread_quantities, :note

  before_save :create_details
  def create_details
    self.class.transaction do
      self.order_details.each(&:destroy)
      bread_quantities.select{|_, qty| qty.to_f > 0.0}.each do |bread_id, quantity|
        bread = Bread.find bread_id
        detail = self.order_details.build
        detail.bread = bread
        detail.quantity = quantity.to_f
      end
    end
  end
end
