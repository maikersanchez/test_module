defmodule IterString do
  defmodule Map do
    def double(s) do
      "#{s}#{s}"
    end

    def triple(s) do
      "#{s}#{s}#{s}"
    end
  end
end
