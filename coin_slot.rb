class CoinSlot

  attr_reader :inserted_money

  def initialize()
    @inserted_money = 0
  end

  def insert_money(coin)
    @inserted_money += coin.value
  end

  def return_inserted_money
    @inserted_money = 0
  end

end