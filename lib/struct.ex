defmodule Geometry do
    defmodule Rectangle do
        defstruct b: 1, h: 1
    end
    defmodule Circle do
        defstruct r: 1
    end
    defmodule HiperCubo do
        defstruct [:a, :d, b: 1, c: 1]
    end
    defprotocol Shape do
    @fallback_to_any true
      def area(data)
      def perimeter(data)
    end

    defimpl Shape, for: Rectangle do
      def area(r) do
        r.a*r.b
      end
      def perimeter(r) do
        2*r.b + 2*r.h
      end
    end

    defimpl Shape, for: Circle  do
        def area(c) do
          :math.pi() * c.r * c.r/2
        end
        def perimeter(c) do
          2* :math.pi() * c.r
        end
      end

      defimpl Shape, for: Any  do
        def area(c) do
          :error
        end
        def perimeter(c) do
            :error
        end
      end
end

# alias Giometry.Rectangle
# alias Giometry.Circle
# alias Giometry.Shape

# IO.puts(Shape.area(%Rectangle{b: 3, h: 4}))
# IO.puts(Shape.perimeter(%Rectangle{b: 3, h: 4}))
# IO.puts(Shape.area(%Circle{}))
# IO.puts(Shape.perimeter(%Circle{}))
# IO.puts(Shape.area("Hola"))
