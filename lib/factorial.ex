defmodule Factorial do
    def fact1(n) when is_integer(n) do
        cond do
            n < 2 -> 1
            true -> n * fact1(n-1)
        end
        
    end

    defp fact1p(n, i, acc) do
        cond do
            i==n -> acc
            true -> fact1p(n, i+1, acc*(i+1))
        end
    end

    def fact2(n) do
        fact1p(n, 0, 1)
    end

    def fact3(n) do
        cond do
            n < 1 -> 1
            true -> fact3(n-1, n)
        end
    end

    def fact3(0, acc) do
        acc
    end

    def fact3(n, acc) do
        fact3(n-1, acc * n)
    end
end