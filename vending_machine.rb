class VendingMachine

  attr_reader :item_selected

  def initialize()
    @item_selected = []
  end

  def select_item(slot)
    @item_selected.delete_at(0)
    @item_selected.push(slot)
    "You have selected '#{slot.slot_position}', please insert £#{slot.slot_item.price}."
  end

  def buy_item(inserted_money)
    item_selected_price = @item_selected[0].slot_item.price 
    if inserted_money < item_selected_price
      "You have inserted £#{inserted_money}, please insert £#{item_selected_price - inserted_money} more"
    elsif inserted_money == item_selected_price
      @item_selected[0].current_level -= 1
      "Please collect your item from the tray"
    else inserted_money > item_selected_price
      @item_selected[0].current_level -= 1
      "Please collect your item from the tray & £#{inserted_money - item_selected_price} from the change drawer"
    end
  end

end