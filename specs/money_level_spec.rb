require 'minitest/autorun'
require 'minitest/rg'
require_relative '../money_level'

class TestItem < MiniTest::Test

  def setup
    @money_level = MoneyLevel.new(20, 20.00, 16.20)
  end

  def test_setup
    assert_equal(20, @money_level.coin_type)
    assert_equal(20.00, @money_level.maximum_level)
    assert_equal(16.20, @money_level.current_level)
  end

  def test_money_can_be_restocked
    @money_level.restock_money
    assert_equal(20.00, @money_level.current_level)
  end

end