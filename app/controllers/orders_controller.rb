# frozen_string_literal: true

class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end
  
    def show
      @order = Order.find(params[:id])
    end
  
    def create
      @order = Order.new(order_params)
  
      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new
      end
    end
  
    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      redirect_to orders_url, notice: 'Order was successfully destroyed.'
    end
  
    private
  
    def order_params
      params.require(:order).permit(:user_id, :item_id)
    end
  end
  