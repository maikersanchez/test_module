defmodule MyAgent3Test do
  use ExUnit.Case
  doctest MyAgent3

  test "Raises an error on start" do
    reason = "some reason"
    {:error, e} = MyAgent3.start_link(fn -> raise reason end)
    assert e.__struct__ == RuntimeError
    assert e.message == reason
  end

  test "Creates an MyAgent3 and gets 3" do
    initial = 30
    {:ok, pid} = MyAgent3.start_link(fn -> initial end)
    ^initial = MyAgent3.get(pid, fn val -> val end)
    MyAgent3.stop(pid)

    {:ok, pid} = MyAgent3.start_link(fn -> {initial, true} end)
    ^initial = MyAgent3.get(pid, fn {val, true} -> val end)
    true = MyAgent3.get(pid, fn {_val, true} -> true end)
    MyAgent3.stop(pid)
  end

  test "Updates the agent" do
    initial = 30
    {:ok, pid} = MyAgent3.start_link(fn -> {initial, true} end)
    MyAgent3.update(pid, fn {val, bool} -> {val + 1, not bool} end)
    expected = initial + 1
    {^expected, false} = MyAgent3.get(pid, fn state -> state end)
    MyAgent3.stop(pid)
  end

  test "Stops the MyAgent3" do
    initial = 10
    {:ok, pid} = MyAgent3.start_link(fn -> {initial, true} end)
    MyAgent3.stop(pid)

    try do
      MyAgent3.get(pid, fn state -> state end)
      raise("The MyAgent3 is stopped and must not get a value from state")
    catch
      :exit, _ -> nil
    end

    try do
      MyAgent3.update(pid, fn state -> state end)
      raise("The MyAgent3 is stopped and must not update the state")
    catch
      :exit, _ -> nil
    end
  end
end
