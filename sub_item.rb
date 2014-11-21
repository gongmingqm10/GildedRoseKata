class SubItem < Item

  def initialize (name, sell_in, quality, strategy)
    super(name, sell_in, quality)
    @strategy = strategy
  end

  def update
    @strategy.update
  end
end