require 'minitest/autorun'
require 'minitest/rg'
require_relative '../vending_slot'
require_relative '../item'

class TestItem < MiniTest::Test

  def setup
    @item1 = Item.new("Coke", 0.65,)
    @vending_slot = VendingSlot.new("A", @item1, 10, 6)
  end

  def test_setup
    assert_equal("A", @vending_slot.slot_position)
    assert_equal(@item1, @vending_slot.slot_item)
    assert_equal(10, @vending_slot.maximum_level)
    assert_equal(6, @vending_slot.current_level)
  end

  def test_restock_items
    @vending_slot.restock_items
    assert_equal(10, @vending_slot.current_level)
  end

end