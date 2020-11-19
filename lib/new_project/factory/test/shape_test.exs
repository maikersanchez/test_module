defmodule ShapeTest do
  use ExUnit.Case
  doctest Shape

  test "Creates a circle from diameter" do
    circle = Shape.create(:circle, %{diameter: 10})
    assert Shape.perimeter(circle) == 10 * :math.pi()
    assert Shape.area(circle) == 25 * :math.pi()
  end

  test "Creates a circle from radius" do
    circle = Shape.create(:circle, %{radius: 5})
    assert Shape.perimeter(circle) == 10 * :math.pi()
    assert Shape.area(circle) == 25 * :math.pi()
  end

  test "Creates a rectangle drom width and height" do
    rect = Shape.create(:rectangle, %{width: 3, height: 4})
    assert Shape.perimeter(rect) == 14
    assert Shape.area(rect) == 12
  end

  test "Creates a square as rectangle from size" do
    rect = Shape.create(:square, %{size: 5})
    assert Shape.perimeter(rect) == 20
    assert Shape.area(rect) == 25
  end

  # @tag :wip
  # test "Creates default circle structure" do
  #   circle = Shape
  # end

  # @tag :wip
  # test "Creates default circle structure" do

  # end
end
