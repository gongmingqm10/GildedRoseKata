require './gilded_rose.rb'
require "rspec"

describe GildedRose do

  it "should do something" do
    subject.update_quality
  end
  
  describe "Aged Brie item" do
    it "should increase with time go on" do
      1.times { subject.update_quality }
      expect(subject.items[1].quality).to eq(1)
    end
  end

  describe "Sulfuras item" do
    it "should keep price" do
      12.times { subject.update_quality }
      expect(subject.items[3].quality).to eq(80)
    end
  end

  describe "Backstage passes" do
    it "should increase price larger than 10" do
      2.times { subject.update_quality }
      expect(subject.items[4].quality).to eq(22)
    end

    it "should increase price away less than 10" do
      6.times { subject.update_quality }
      expect(subject.items[4].quality).to eq(27)
    end

    it "should increase price away less than 5" do
      11.times { subject.update_quality }
      expect(subject.items[4].quality).to eq(38)
    end

    it "should be 50 at last day" do
      15.times{subject.update_quality}
      expect(subject.items[4].quality).to eq(50)
    end

    it "should be zero when expired" do
      16.times {subject.update_quality}
      expect(subject.items[4].quality).to eq(0)
    end
  end





end
