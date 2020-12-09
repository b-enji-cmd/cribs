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
    total_area.to_f
  end

  def price_per_square_foot
    rooms_area = area
    (@price / rooms_area).to_f.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_by_category
    room_details = Hash.new { |h, k| h[k] = [] }
    @rooms.map do |room|
      room_details[room.category] << room
    end
    room_details
  end
  
end
