class VendingMachine

  def select_item(slot)
    "You have selected '#{slot.slot_position}', please insert £#{slot.slot_item.price}."
  end

end