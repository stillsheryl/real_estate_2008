class House
  attr_reader :price, :address, :rooms, :total_area
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @total_area = 0
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.delete("$").to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.each do |room|
      @total_area += room.area.to_i
    end
    total_area
  end

  def details
    details_hash = Hash.new
    details_hash["price"] = @price.delete("$").to_i
    details_hash["address"] = @address
    details_hash
  end

  def price_per_square_foot
    (@price.delete("$").to_i / area.to_f).round(2)
  end

end
