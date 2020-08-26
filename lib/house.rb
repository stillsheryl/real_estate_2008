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

end
