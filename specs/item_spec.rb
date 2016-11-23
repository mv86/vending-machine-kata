require 'minitest/autorun'
require 'minitest/rg'
require_relative '../item'

class TestItem < MiniTest::Test

  def setup
    @item = Item.new("Coke", 0.65,)
  end

  def test_setup
    assert_equal("Coke", @item.name)
    assert_equal(0.65, @item.price)
  end

end