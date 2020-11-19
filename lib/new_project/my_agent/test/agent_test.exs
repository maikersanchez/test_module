defmodule AgentTest do
  use ExUnit.Case
  doctest Agent

  test "Creates an agent and gets 3" do
    initial = 30
    {:ok, pid} = Agent.start_link(fn -> initial end)
    ^initial = Agent.get(pid, fn val -> val end)
    Agent.stop(pid)

    {:ok, pid} = Agent.start_link(fn -> {initial, true} end)
    ^initial = Agent.get(pid, fn {val, true} -> val end)
    true = Agent.get(pid, fn {_val, true} -> true end)
    Agent.stop(pid)
  end

  test "Updates the agent" do
    initial = 30
    {:ok, pid} = Agent.start_link(fn -> {initial, true} end)
    Agent.update(pid, fn {val, bool} -> {val + 1, not bool} end)
    expected = initial + 1
    {^expected, false} = Agent.get(pid, fn state -> state end)
    Agent.stop(pid)
  end

  test "Stops the agent" do
    initial = 10
    {:ok, pid} = Agent.start_link(fn -> {initial, true} end)
    Agent.stop(pid)

    try do
      Agent.get(pid, fn state -> state end)
      raise("The agent is stopped and must not get a value from state")
    catch
      :exit, _ -> nil
    end

    try do
      Agent.update(pid, fn state -> state end)
      raise("The agent is stopped and must not update the state")
    catch
      :exit, _ -> nil
    end
  end
end
