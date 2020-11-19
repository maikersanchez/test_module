defmodule MyEnum do
  def print(list) do
    for i <- 0..(length(list) - 1) do
      IO.puts(Enum.at(list, i))
    end
  end

  def map(list, fun) do
    Enum.reduce(list, [], fn elem, acc -> acc ++ [fun.(elem)] end)
  end

  def reduce(list, fun) do
    [acc | tail] = list
    Enum.reduce(tail, acc, fun)
  end
end

list = Enum.map([1, 2, 5, 4], fn n -> n * n end)
MyEnum.print(list)

filtered = Enum.filter(list, fn it -> it < 10 or it >= 20 end)
MyEnum.print(filtered)

# [head | tail] = list
# reduced1 = Enum.reduce(tail, head, fn a, b -> a + b end)
reduced1 = Enum.reduce(list, fn a, b -> a + b end)
IO.puts(reduced1)

# [1 4 25 16]
# acc = fun(0, 1); tail = [4 25 16]
# acc = fun(1, 4); tail = [25 16]
# acc = fun(5, 25); tail = [16]
# acc = fun(30, 16); tail = []
# acc = fun(46),
reduced2 = Enum.reduce(list, 0, fn a, b -> a + b end)
IO.puts(reduced2)

map1 = MyEnum.map(list, fn n -> n * n end)
IO.puts(map1)
MyEnum.print(map1)
