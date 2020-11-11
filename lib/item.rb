class Item
  attr_reader :name

  def initialize(info)
    @name = info[:name]
    @item_price = info[:price]
  end

  def price
    @item_price[1..-1].to_f
  end
end
