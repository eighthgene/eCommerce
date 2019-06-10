# frozen_string_literal: true

class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_paypaltoken, only: %i[createpayment executepayment]

  def show
    @order_items = current_order.order_items
  end

  def set_paypaltoken
    @paypaltoken = 'A21AAHKfz6KphCLVSYhk5eYQDbaEjE4gGDfw7qlT7CEctRKKyq_ueoPGm5hU6aJFRVNuS7xIG26mIBoXa09YNSYFkNgaJM-pQ'
  end

  def home; end

  def createpayment
    @order = current_order
    @response = HTTParty.post('https://api.sandbox.paypal.com/v1/payments/payment',
                              headers: { 'Content-Type' => 'application/json',
                                         'Authorization' => "Bearer #{@paypaltoken}" },
                              body: { intent: 'sale',
                                      redirect_urls: {
                                        'return_url' => 'http://localhost:3000/',
                                        'cancel_url' => 'http://localhost:3000/'
                                      },
                                      payer: { 'payment_method' => 'paypal' },
                                      transactions: [
                                        { 'amount' => {
                                          'total' => @order.subtotal,
                                          'currency' => 'EUR'
                                        } }
                                      ] }.to_json, debug_output: Rails.logger)
    render json: {
      id: (@response['id']).to_s
    }.to_json
  end

  def executepayment
    @response = HTTParty.post("https://api.sandbox.paypal.com/v1/payments/payment/#{params[:paymentID]}/execute/",
                              headers: { 'Content-Type' => 'application/json',
                                         'Authorization' => "Bearer #{@paypaltoken}" },
                              body: { payer_id: params[:payerID].to_s }.to_json, debug_output: Rails.logger)

    @order = current_order
    @order.update_user(current_user.id)

    # update payment status
    body = JSON.parse(@response.body)
    state = body['state']
    if state.to_s == 'approved'
      @order.update_status_paid
    end

    # Clean order and create new order
    session[:order_id] = nil

  end
end
