defmodule Main do
  import Iterator

  def init do
    list = [1, 3, 5, 15, 16, 8]
    {:ok, iter} = Iterator.new(list);
    each(iter, list, 0)
  end

  def each(pid, list, index) do
    there_is_a_next = Iterator.next?(pid)



    if there_is_a_next do
      if Iterator.next(pid) == Enum.at(list, index) do
      each(pid, list, index + 1)
      end
    end

    IO.puts("valor index #{index}, total #{length(list)}")
  end
end
