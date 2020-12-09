require './lib/room'
require './lib/house'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_is
    assert_instance_of House, @house
  end

  def test_it_has_things
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1,@room_2], @house.rooms
  end

  def test_market_avg
    assert_equal false, @house.above_market_average?
  end

  def test_categorization_of_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    @house.rooms_from_category(:bedroom)
    assert_equal [@room_1,@room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_total_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900 , @house.area
  end

  def test_house_details

  end
end