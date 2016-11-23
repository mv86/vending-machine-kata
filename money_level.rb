class MoneyLevel

  attr_reader :coin_type, :maximum_level, :current_level

  def initialize(coin_type, maximum_level, current_level)
    @coin_type = coin_type
    @maximum_level = maximum_level
    @current_level = current_level
  end

  def restock_money
    @current_level = @maximum_level
  end

end