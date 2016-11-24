require 'minitest/autorun'
require 'minitest/rg'
require_relative '../vending_machine'
require_relative '../coin_slot'
require_relative '../coin'
require_relative '../item'
require_relative '../vending_slot'
require_relative '../money_level'

class CoinSpecTest < MiniTest::Test

  def setup
    @vending_machine = VendingMachine.new()
    @coin_slot = CoinSlot.new()
    @coin20 = Coin.new(0.20)
    @coin50 = Coin.new(0.50)
    @coin100 = Coin.new(1.00)
    @item1 = Item.new("Coke", 0.65)
    @item2 = Item.new("Walkers Crisps", 1.00)
    @item3 = Item.new("Ham Sandwich", 1.50)
    @vending_slot1 = VendingSlot.new("A", @item1, 10, 6)
    @vending_slot2 = VendingSlot.new("B", @item2, 15, 9)
    @vending_slot3 = VendingSlot.new("C", @item3, 6, 1)
  end

  def test_item_selected
    assert_equal("You have selected 'A', please insert £0.65.", 
      @vending_machine.select_item(@vending_slot1))
  end

  def test_cannot_buy_item
    @vending_machine.select_item(@vending_slot1))
    assert_equal("You have inserted £0, please insert £0.65 more", 
      @vending_machine.buy_item())
  end

  def test_can_buy_item_exact_money
    @vending_machine.select_item(@vending_slot2))
    @coin_slot.insert(@coin100)
    assert_equal("Please collect your item from the tray", 
      @vending_machine.buy_item())
  end

  def test_can_buy_item_return_change
    @vending_machine.select_item(@vending_slot1))
    @coin_slot.insert(@coin100)
    assert_equal("Please collect your item from the tray & £0.35 from the change drawer",
       @vending_machine.buy_item())
  end

end