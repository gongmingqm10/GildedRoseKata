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

    @items.each { |item|
      case item.name
        when "Aged Brie"
          increase_quality(item)
          if expired? item
            increase_quality(item)
          end

        when "Backstage passes to a TAFKAL80ETC concert"
          increase_quality(item)
          if (item.sell_in < 11)
            increase_quality(item)
          end
          if (item.sell_in < 6)
            increase_quality(item)
          end

          if expired? item
            item.quality = 0
          end

        when "Sulfuras, Hand of Ragnaros"

        else
          decrease_quality(item)

          if expired? item
            decrease_quality(item)
          end
      end
    }
    
  end


  private

  def increase_quality(item)
    if (item.quality < 50)
      item.quality = item.quality + 1
    end
  end

  def decrease_quality(item)
    if (item.quality > 0)
      item.quality = item.quality - 1
    end
  end

  def expired?(item)
    item.sell_in = item.sell_in - 1;
    item.sell_in < 0
  end


end