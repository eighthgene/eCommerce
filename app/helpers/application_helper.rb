module ApplicationHelper

  def current_order
    (session[:products_views] ||= [])
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
