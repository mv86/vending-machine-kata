require 'minitest/autorun'
require 'minitest/rg'
require_relative '../coin_slot'
require_relative '../coin'

class CoinSpecTest < MiniTest::Test

  def setup
    @coin_slot = CoinSlot.new()
    @coin20 = Coin.new(0.20)
  end

  def test_setup
    assert_equal(0, @coin_slot.inserted_money)
  end

  def test_insert_money
    @coin_slot.insert_money(@coin20)
    assert_equal(0.20, @coin_slot.inserted_money)
  end

end