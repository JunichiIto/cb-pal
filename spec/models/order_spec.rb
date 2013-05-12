# coding: utf-8
require 'spec_helper'

describe Order do
  describe "::create" do
    before do
      menu = Menu.new
      menu.quantity = 5
      @bread1 = menu.build_bread
      @bread1.name = "クリームぱん"
      menu.save!

      menu = Menu.new
      menu.quantity = 5
      @bread2 = menu.build_bread
      @bread2.name = "あんぱん"
      menu.save!

      menu = Menu.new
      menu.quantity = 5
      @bread3 = menu.build_bread
      @bread3.name = "バゲット"
      menu.save!

      @param = {"customer_name"=>"たなか", "bread_quantities"=>{@bread1.id.to_s => "1", @bread2.id.to_s => "0", @bread3.id.to_s => "0.5"}}
    end

    subject { Order.create @param }

    it 'creates order' do
      expect(subject).to be_persisted
    end

    it 'saves customer_name' do
      expect(subject.customer_name).to eq "たなか"
    end

    it 'creates order details' do
      expect(subject.order_details).to have(2).items
    end

    it 'creates order detail for クリームぱん' do
      detail = subject.order_details.where(bread_id: @bread1.id).first
      expect(detail.quantity).to eq 1.0
    end

    it 'creates order detail for バゲット' do
      detail = subject.order_details.where(bread_id: @bread3.id).first
      expect(detail.quantity).to eq 0.5
    end
  end
end
