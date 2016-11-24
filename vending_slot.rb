class VendingSlot

  attr_reader :slot_position, :slot_item, :maximum_level

  attr_accessor :current_level

  def initialize(slot_position, slot_item, maximum_level, current_level)
    @slot_position = slot_position
    @slot_item = slot_item
    @maximum_level = maximum_level
    @current_level = current_level
  end

  def restock_items
    @current_level = @maximum_level
  end

end