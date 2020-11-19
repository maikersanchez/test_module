defmodule MyAgent do
  def start(initial_value) do
    Agent.start_link(fn -> initial_value end)
  end

  def read(pid) do
    IO.inspect(Agent.get(pid, fn state -> state end))
  end

  def update(pid, value) do
    Agent.update(pid, value)
  end

  def close(pid) do
    value = read(pid)
    Agent.stop(pid)
    value
  end

end
