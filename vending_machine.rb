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
    response = "I'm sorry. That item is out of stock"
    if @item_selected[0].current_level > 0 
      if inserted_money < item_selected_price
        response = insufficient_funds(inserted_money, item_selected_price)
      elsif inserted_money == item_selected_price
        @item_selected[0].current_level -= 1
        response = correct_money
      else inserted_money > item_selected_price
        @item_selected[0].current_level -= 1
        response = item_and_change(inserted_money, item_selected_price)
      end
    end
    return response

  end

  def insufficient_funds(inserted_money, item_selected_price)
   "You have inserted £#{sprintf( "%0.02f", inserted_money)}, please insert £#{sprintf("%0.02f", (item_selected_price - inserted_money))} more"
  end 

  def correct_money
  "Please collect your item from the tray"
  end

  def item_and_change(inserted_money, item_selected_price)
    "Please collect your item from the tray & £#{sprintf("%0.02f", (inserted_money - item_selected_price))} from the change drawer"
  end

end