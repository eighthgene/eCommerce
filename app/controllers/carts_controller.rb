class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_paypaltoken, :only => [:createpayment, :executepayment]

  def show
    @order_items = current_order.order_items
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path and return
    end
  end

  def set_paypaltoken
    @paypaltoken = 'A21AAFH5Mr4j_M4q8a-RrI9cm6LvRC7dtojsh2u-cd064tisZVktx5AquAAjZo-FEWcKZ_50t0kxHIFNLtI4CNCRYHQk7UnvA'
  end

  def home
  end

  def createpayment
    @total = current_order.subtotal

    @response = HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
                              :headers => {'Content-Type' => 'application/json',
                                           'Authorization' => "Bearer #{@paypaltoken}"},
                              :body => {:intent => 'sale',
                                        :redirect_urls => {
                                            'return_url' => 'http://localhost:3000/',
                                            'cancel_url' => 'http://localhost:3000/'
                                        },
                                        :payer => {'payment_method' => 'paypal'},
                                        :transactions => [
                                            {'amount' => {
                                                'total' => @total,
                                                'currency' => 'EUR'}
                                            }]
                              }.to_json, :debug_output => Rails.logger)
    render json: {
        id: "#{@response["id"]}"
    }.to_json
  end

  def executepayment
    @response = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/",
                              :headers => {'Content-Type' => 'application/json',
                                           'Authorization' => "Bearer #{@paypaltoken}"},
                              :body => {:payer_id => "#{params[:payerID]}"}.to_json, :debug_output => Rails.logger)

    # Clean order and create new order
    session[:order_id] = NIL
  end
end
