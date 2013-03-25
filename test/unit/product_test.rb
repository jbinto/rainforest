require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @p = FactoryGirl.create(:product)
    assert @p.valid?
  end

  test "must have a description" do
    @p.description = ""
    refute @p.valid?
  end

  test "must have a name" do
    @p.name = ""
    refute @p.valid?
  end

  test "must have a numerical price_in_cents" do
    @p.price_in_cents = "foo"
    refute @p.valid?
  end
end