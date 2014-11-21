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

    for i in 0..(@items.size-1)

      case @items[i].name
        when "Aged Brie"
          increase_quality(i)
        when "Backstage passes to a TAFKAL80ETC concert"
          increase_quality(i)
          if (@items[i].sell_in < 11)
            increase_quality(i)
          end
          if (@items[i].sell_in < 6)
            increase_quality(i)
          end
        when "Sulfuras, Hand of Ragnaros"
        else
          decrease_quality(i)
      end

      if (@items[i].name != "Sulfuras, Hand of Ragnaros")
        @items[i].sell_in = @items[i].sell_in - 1;
      end


      if (@items[i].sell_in < 0)

        if (@items[i].name != "Aged Brie")
          if (@items[i].name != "Backstage passes to a TAFKAL80ETC concert" && @items[i].name != "Sulfuras, Hand of Ragnaros")
            decrease_quality(i)
          else
            @items[i].quality = 0
          end
        else
          increase_quality(i)
        end

      end
    end
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


end