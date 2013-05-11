class Bread < ActiveRecord::Base
  has_one :menu, dependent: :destroy
  validates_presence_of :name
end
