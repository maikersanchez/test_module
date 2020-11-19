defmodule MyAgent2Test do
  use ExUnit.Case
  doctest MyAgent2
  test "Creates an agent and gets 3" do
    initial = 30
    {:ok, pid} = MyAgent2.start_link(fn -> initial end)
    ^initial = MyAgent2.get(pid, fn val -> val end)
    MyAgent2.stop(pid)

    {:ok, pid} = MyAgent2.start_link(fn -> {initial, true} end)
    ^initial = MyAgent2.get(pid, fn {val, true} -> val end)
    true = MyAgent2.get(pid, fn {_val, true} -> true end)
    MyAgent2.stop(pid)
  end
  test "Updates the agent" do
    initial = 30
    {:ok, pid} = MyAgent2.start_link(fn -> {initial, true} end)
    MyAgent2.update(pid, fn {val, bool} -> {val+1, not bool} end)
    expected = initial + 1
    {^expected, false} = MyAgent2.get(pid, fn state -> state end)
    MyAgent2.stop(pid)
  end

  test "Stops the agent" do
    initial = 10
    {:ok, pid} = MyAgent2.start_link(fn -> {initial, true} end)
    MyAgent2.stop(pid)

    try do
      MyAgent2.get(pid, fn state -> state end)
      raise("The agent is stopped and must not get a value from state")
    catch
      :exit, _ -> nil
    end

    try do
      MyAgent2.update(pid, fn state -> state end)
      raise("The agent is stopped and must not update the state")
    catch
      :exit, _ -> nil
    end
  end
end
