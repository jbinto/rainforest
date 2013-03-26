class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :price_in_dollars

  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}
  validates :price_in_dollars, :numericality => { greater_than: 0 }

  has_many :reviews

  def price_in_dollars
    if self.price_in_cents?
     self.price_in_cents.to_f / 100.0
    end
  end

  def price_in_dollars=(dollars)
    if dollars.present?
     self.price_in_cents = (dollars.to_f * 100).to_i
    end
  end
end
