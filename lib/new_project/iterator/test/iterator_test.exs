defmodule IteratorTest do
  use ExUnit.Case
  doctest Iterator

  test "Creations iterator list" do
    list = [1, 3, 5, 15, 16, 8]
    {:ok, iter} = Iterator.new(list);
    each(iter, list, 0)
  end

  # def each(pid, list, index) do
  #   there_is_a_next = Iterator.next?(pid)
  #   assert is_boolean(there_is_a_next)

  #   if there_is_a_next do
  #     assert Iterator.next(pid) == Enum.at(list, index)
  #     each(pid, list, index + 1)
  #   end

  #   assert index == length(list)-1
  # end

  def each(pid, list, index) do
    is_there_a_next = Iterator.next?(pid)
    assert is_boolean(is_there_a_next)

    if is_there_a_next do
      assert Iterator.next(pid) == Enum.at(list, index)
      each(pid, list, index + 1)
    else
      assert index == length(list)
    end

  end
end
