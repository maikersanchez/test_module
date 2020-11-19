defmodule Shape.CircleTest do
  use ExUnit.Case
  doctest Shape.Circle

  alias Shape.Circle

  test "Circle must have a non-nil radius" do
    circle = %Circle{radius: 3}
    assert circle.radius == 3
    assert Circle.perimeter(circle) == 6 * :math.pi()
    assert Circle.area(circle) == 9 *:math.pi()
  end

  test "Circle must have a nil radius" do
    circle = %Circle{radius: nil}
    assert circle.radius == nil
  end

  test "Creates circle with create method" do
    try do
      Circle.create(nil)
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(-2)
      raise "The radius must be positive"
    rescue
      FunctionClauseError -> nil
    end

    try do
      Circle.create(0)
      raise "The radius must be greater than zero"
    rescue
      FunctionClauseError -> nil
    end

    circle = Circle.create(1.5)
    assert circle.radius == 1.5
  end
end
