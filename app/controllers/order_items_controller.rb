class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    flash.notice = @order_item.product.title + ' added to your cart'
    redirect_back fallback_location: root_path
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    flash.notice = 'Item removed'
    redirect_back fallback_location: root_path
  end


  private

  #TODO add size and color
  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

end
