class Menu < ActiveRecord::Base
  belongs_to :bread
  attr_accessible :quantity

  validates_presence_of :quantity, :bread

  def self.bulk_create(text)
    self.transaction do
      Bread.destroy_all
      text.each_line do |line|
        items = line.strip.split(' ')
        menu = self.new
        menu.quantity = items.last.to_f
        bread = menu.build_bread
        bread.name = items.first
        menu.save!
      end
    end
  end
end
