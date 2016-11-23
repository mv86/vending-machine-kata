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
    @item1 = Item.new("Walkers Crisps", 1.00)
    @item1 = Item.new("Ham Sandwich", 1.50)
    @vending_slot = VendingSlot.new("A", 10, 6)
    @vending_slot = VendingSlot.new("B", 15, 9)
    @vending_slot = VendingSlot.new("C", 6, 1)
  end

end