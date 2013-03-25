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

  test "must have a price_in_cents" do
    @p.price_in_cents = nil
    refute @p.valid?
  end

  test "must have an integer for price_in_cents" do
    @p.price_in_cents = 4.50
    refute @p.valid?
  end

  test "must have a numerical price_in_dollars" do
    @p.price_in_dollars = "bar"
    refute @p.valid?
  end

  test "must have a greater-than-zero price_in_dollars" do
    @p.price_in_dollars = "-3403"
    refute @p.valid?
  end

  test "price_in_dollars accepts decimal and converts to cents correctly" do
    @p.price_in_dollars = "123.45"
    assert @p.price_in_cents == 12345
  end

  test "price_in_dollars displays an existing price_in_cents correctly" do
    @p.price_in_cents = 12345
    assert @p.price_in_dollars == 123.45
  end

  # Personally, I think it should reject anything beyond 2 decimals.
  
  # The danger of writing tests after is that you write tests that verify
  # the existing behavior, rather than *thinking* about what it is you want.

  test "price_in_dollars handles multiple decimal places" do
    @p.price_in_dollars = "12.424553"
    assert_equal 1242, @p.price_in_cents
  end

  test "dollar conversion is not performed for empty/blank cents value" do
    @p.price_in_cents = nil
    assert_nil @p.price_in_dollars
  end

end