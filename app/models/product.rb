class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :price_in_dollars

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  def price_in_dollars
  	self.price_in_cents.to_f / 100.0
  end

  def price_in_dollars=(dollars)
  	self.price_in_cents = (dollars.to_f * 100).to_i
  end
end
