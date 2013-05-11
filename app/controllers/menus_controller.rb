# coding: utf-8
class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new_bulk_create
    @bulk_menu_text = ""
  end

  def bulk_create
    @bulk_menu_text = params[:bulk_menu_text]
    Menu.bulk_create @bulk_menu_text
    
    respond_to do |format|
      format.html { redirect_to new_bulk_create_menus_path, notice: "作成しました" }
    end
  end
end
