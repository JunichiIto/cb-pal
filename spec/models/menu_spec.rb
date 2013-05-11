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
end
