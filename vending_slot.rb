class VendingSlot

  attr_reader :slot_position, :maximum_level, :current_level

  def initialize(slot_position, maximum_level, current_level)
    @slot_position = slot_position
    @maximum_level = maximum_level
    @current_level = current_level
  end

  def restock_items
    @current_level = @maximum_level
  end

end