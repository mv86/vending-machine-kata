require 'minitest/autorun'
require 'minitest/rg'
require_relative '../vending_machine'
require_relative '../coin_slot'
require_relative '../coin'
require_relative '../item'
require_relative '../vending_slot'
require_relative '../money_level'

class VendingMachineTest < MiniTest::Test

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

  def test_setup
    assert_equal([], @vending_machine.item_selected)
  end

  def test_item_selected
    assert_equal("You have selected 'A', please insert £0.65.", 
      @vending_machine.select_item(@vending_slot1))
    @vending_machine.select_item(@vending_slot1)
    assert_equal([@vending_slot1], @vending_machine.item_selected)
  end

  def test_cannot_buy_item
    @vending_machine.select_item(@vending_slot1)
    assert_equal("You have inserted £0.00, please insert £0.65 more", 
      @vending_machine.buy_item(@coin_slot.inserted_money))
  end

  def test_can_buy_item_exact_money
    @vending_machine.select_item(@vending_slot2)
    @coin_slot.insert_money(@coin100)
    assert_equal("Please collect your item from the tray", 
      @vending_machine.buy_item(@coin_slot.inserted_money))
  end

  def test_can_buy_item_return_change
    @vending_machine.select_item(@vending_slot1)
    @coin_slot.insert_money(@coin100)
    assert_equal("Please collect your item from the tray & £0.35 from the change drawer",
       @vending_machine.buy_item(@coin_slot.inserted_money))
  end

  def test_add_money_until_can_buy_item
    @vending_machine.select_item(@vending_slot1)
    inserted_money = @coin_slot.insert_money(@coin50)
    assert_equal("You have inserted £0.50, please insert £0.15 more", @vending_machine.buy_item(inserted_money))
    inserted_money = @coin_slot.insert_money(@coin20)
    assert_equal("Please collect your item from the tray & £0.05 from the change drawer", @vending_machine.buy_item(inserted_money))
  end

  def test_stock_levels_decrease
    @vending_machine.select_item(@vending_slot1)
    @coin_slot.insert_money(@coin100)
    first_item_bought = @vending_machine.buy_item(@coin_slot.inserted_money)
    assert_equal(5, @vending_slot1.current_level)
  end

  def test_item_out_of_stock
    @vending_machine.select_item(@vending_slot3)
    inserted_money = @coin_slot.insert_money(@coin100)
    inserted_money += @coin_slot.insert_money(@coin50)
    @vending_machine.buy_item(inserted_money)
    assert_equal(0, @vending_slot3.current_level)
    @vending_machine.select_item(@vending_slot3)
    assert_equal("I'm sorry. That item is out of stock", @vending_machine.buy_item(inserted_money))
  end

end