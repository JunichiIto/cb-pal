# coding: utf-8
class OrdersController < ApplicationController
  before_filter :load_order, only: %w(edit update destroy)

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: "作成しました" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def index
    @orders = Order.order("created_at DESC")
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update_attributes params[:order]
        format.html { redirect_to orders_path, notice: "更新しました" }
      else
        format.html { render action: "update" }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path, notice: "削除しました" }
    end
  end

  private

  def load_order
    @order = Order.find(params[:id])
  end
end
