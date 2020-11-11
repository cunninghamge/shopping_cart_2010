class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.check_stock(item) != 0
    end
  end

  def items
    @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end
  end

  def item_quantity(item)
    vendors_that_sell(item).sum do |vendor|
      vendor.check_stock(item)
    end
  end
end
