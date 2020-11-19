defmodule Iter do
  defmodule Map do
    def double(x) do
      2 * x
    end

    def triple(x) do
      3 * x
    end
  end

  defmodule Filter do
    def is_mod4(x) do
      rem(x, 4)
    end

    def is_mod3(x) do
      rem(x, 3)
    end

    def is_mod3_plus1(x) do
      rem(x, 3) == 1
    end

    def is_mod4_plus1(x) do
      rem(x, 4) == 1
    end
  end
end
