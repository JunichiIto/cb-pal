class Bread < ActiveRecord::Base
  has_one :menu, dependent: :destroy
  has_many :order_details
  validates_presence_of :name
end
