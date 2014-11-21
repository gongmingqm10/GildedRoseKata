require './item.rb'

class GildedRose

  attr_accessor :items

  @items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def update_quality

    (0..(@items.size-1)).each { |index|
      case @items[index].name
        when "Aged Brie"
          increase_quality(index)

          if expired? index
            increase_quality(index)
          end

        when "Backstage passes to a TAFKAL80ETC concert"
          increase_quality(index)
          if (@items[index].sell_in < 11)
            increase_quality(index)
          end
          if (@items[index].sell_in < 6)
            increase_quality(index)
          end

          if expired? index
            items[index].quality = 0
          end

        when "Sulfuras, Hand of Ragnaros"

        else
          decrease_quality(index)

          if expired? index
            decrease_quality(index)
          end
      end
    }
  end


  private

  def increase_quality(i)
    if (@items[i].quality < 50)
      @items[i].quality = @items[i].quality + 1
    end
  end

  def decrease_quality(i)
    if (@items[i].quality > 0)
      @items[i].quality = @items[i].quality - 1
    end
  end

  def expired?(i)
    @items[i].sell_in = @items[i].sell_in - 1;
    @items[i].sell_in < 0
  end


end