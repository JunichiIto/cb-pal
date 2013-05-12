# coding: utf-8
require 'spec_helper'

describe Menu do
  describe "::bulk_create" do
    let(:text) { "あんぱん 10\nバゲット 5" }
    before do
      menu = Menu.new
      menu.quantity = 1
      bread = menu.build_bread
      bread.name = "クリームぱん"
      menu.save!

      Menu.bulk_create(text)
    end
    it 'creates breads' do
      expect(Bread.all).to have(2).items
    end
    it 'creates あんぱん' do
      expect(Bread.where(name: "あんぱん")).to be_present
    end
    it 'creates バゲット' do
      expect(Bread.where(name: "バゲット")).to be_present
    end
    it 'creates menu' do
      expect(Menu.all).to have(2).items
    end
    specify "あんぱんは10こ" do
      bread = Bread.where(name: "あんぱん").first
      expect(bread.menu.quantity).to eq 10
    end
    specify "バゲットは5こ" do
      bread = Bread.where(name: "バゲット").first
      expect(bread.menu.quantity).to eq 5
    end
    it 'deletes old bread' do
      expect(Bread.where(name: "クリームぱん")).to be_blank
    end
  end

  describe "remaining_bread_count" do
    before do
      @menu1 = Menu.new
      @menu1.quantity = 10
      bread1 = @menu1.build_bread
      bread1.name = "クリームぱん"
      @menu1.save!

      @menu2 = Menu.new
      @menu2.quantity = 5
      bread2 = @menu2.build_bread
      bread2.name = "バゲット"
      @menu2.save!

      Order.create "customer_name" => "たなか", "bread_quantities" => {bread1.id.to_s => "1"}
      Order.create "customer_name" => "さとう", "bread_quantities" => {bread1.id.to_s => "2"}
      Order.create "customer_name" => "にしわき", "bread_quantities" => {bread2.id.to_s => "0.5"}

      @menu1.reload
      @menu2.reload
    end

    it "returns valid remaining bread count for クリームぱん" do
      expect(@menu1.remaining_bread_count).to eq 7.0
    end

    it "returns valid remaining bread count for バゲット" do
      expect(@menu2.remaining_bread_count).to eq 4.5
    end
  end
end
