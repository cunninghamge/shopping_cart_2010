class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amt)
    @inventory[item] += amt
  end

  def potential_revenue
    @inventory.sum do |item, quantity|
      item.price * quantity
    end
  end

  def sell(item, quantity)
    until @inventory[item] == 0 || quantity == 0
      quantity -= 1
      @inventory[item] -= 1
    end
    quantity
  end
end
