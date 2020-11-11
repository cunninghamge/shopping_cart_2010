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
    end.uniq
  end

  def item_quantity(item)
    vendors_that_sell(item).sum do |vendor|
      vendor.check_stock(item)
    end
  end

  def total_inventory
    items.each_with_object(Hash.new {|h,k| h[k] = {} }) do |item, hash_obj|
      hash_obj[item][:quantity] = item_quantity(item)
      hash_obj[item][:vendors] = vendors_that_sell(item)
    end
  end

  def overstocked_items
    items.select do |item|
      (vendors_that_sell(item).count > 1) && (item_quantity(item) > 50)
    end
  end

  def sorted_item_list
    items.reduce([]) do |list, item|
      list << item.name
      list.sort
    end
  end
end
