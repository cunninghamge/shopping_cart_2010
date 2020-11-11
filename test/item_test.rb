require "minitest/autorun"
require "minitest/pride"
require './lib/item'

class ItemTest < Minitest::Test
  def setup
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Item, @item2
  end

  def test_attributes
    assert_equal "Tomato", @item2.name
    assert_equal 0.5, @item2.price
  end
end
