defmodule Shape.RectangleTest do
  use ExUnit.Case
  doctest Shape.Rectangle

  alias Shape.Rectangle

  test "Rectangle must have a non-nil radius" do
    rect = %Rectangle{width: 3, height: 4}
    assert rect.width == 3 && rect.height == 4
    assert Shape.perimeter(rect) == 14
    assert Shape.area(rect) == 12
  end

  test "Rectangle must have a nil radius" do
    Rectangle = %Rectangle{width: nil, height: nil}
    assert circle.radius == nil
  end


end
