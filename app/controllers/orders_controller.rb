# coding: utf-8
class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to new_order_path, notice: "作成しました" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def index
    @orders = Order.order("created_at DESC")
  end
end
