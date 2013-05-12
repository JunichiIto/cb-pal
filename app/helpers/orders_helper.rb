module OrdersHelper
  def bread_quantity(menu, order)
    order.order_details.where(bread_id: menu.bread.id).first.try(:quantity) || 0.0
  end
end
