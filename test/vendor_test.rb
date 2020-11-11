require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor1
  end

  def test_attributes
    assert_equal "Rocky Mountain Fresh", @vendor1.name
    assert_equal ({}), @vendor1.inventory
  end

  def test_it_starts_with_no_stock
    assert_equal 0, @vendor1.check_stock(@item1)
  end

  def test_stock
    @vendor1.stock(@item1, 30)

    assert_equal 30, @vendor1.check_stock(@item1)
    assert_equal ({@item1=> 30}), @vendor1.inventory

    @vendor1.stock(@item1, 25)

    assert_equal 55, @vendor1.check_stock(@item1)

    @vendor1.stock(@item2, 12)

    expected = {@item1=> 55, @item2=> 12}
    assert_equal expected, @vendor1.inventory
  end

  def test_potential_revenue
    assert_equal 29.75, @vendor1.potential_revenue
    assert_equal 345.00, @vendor2.potential_revenue
    assert_equal 48.75, @vendor3.potential_revenue
  end
end
