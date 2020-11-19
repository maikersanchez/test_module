defmodule Shape do

  defmodule Circle do

    @enforce_keys [:radius]
    defstruct [:radius]

    def create(radius) when radius != nil and radius > 0 do
      %Circle{radius: radius}
    end

    def perimeter(circle) when circle.__struct__ == Circle do
      2 * circle.radius * :math.pi()
    end

    def area(circle) when circle.__struct__ == Circle do
      :math.pi() * circle.radius * circle.radius
    end

  end

  defmodule Rectangle do
    @enforce_keys [:width, :height]
    defstruct [:width, :height]

    def create(width, height) when width != nil and width > 0 and height != nil and height > 0 do
      %Rectangle{width: width, height: height}
    end

    def perimeter(rectangle) when rectangle.__struct__ == Rectangle do
      2 * (rectangle.width + rectangle.height)
    end

    def area(rectangle) when rectangle.__struct__ == Rectangle do
      rectangle.width * rectangle.height
    end
  end

  def create(:circle, %{radius: r}) do
    %Circle{radius: r}
  end

  def create(:circle, %{diameter: d}) do
    %Circle{radius: d/2}
  end

  def create(:rectangle, %{width: w, height: h}) do
    %Rectangle{width: w, height: h}
  end

  def create(:square, %{size: s}) do
    %Rectangle{width: s, height: s}
  end
  def perimeter(circle) when circle.__struct__ == Circle do
    Circle.perimeter(circle)
  end
  def perimeter(rectangle) when rectangle.__struct__ == Rectangle do
    Rectangle.perimeter(rectangle)
  end
  def area(circle) when circle.__struct__ == Circle do
    Circle.area(circle)
  end
  def area(rectangle) when rectangle.__struct__ == Rectangle do
    Rectangle.area(rectangle)
  end
end
