class House
  attr_reader :price,
              :address,
              :rooms,
              :details

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @details = {"price" =>  @price, "address" => @address }
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(arg_cat)
    @rooms.find_all do |room|
      room.category == arg_cat
    end
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end
end
