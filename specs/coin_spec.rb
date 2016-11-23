require 'minitest/autorun'
require 'minitest/rg'
require_relative '../coin.rb'

class CoinSlotTest < MiniTest::Test

  def setup
    @coin = Coin.new("20")
  end

  def test_coin_value
    assert_equal("20", @coin.value)
  end


end