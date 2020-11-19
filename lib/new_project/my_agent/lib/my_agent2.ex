defmodule MyAgent2 do
  def start_link(onCreate) do
    Agent.start_link(onCreate)
  end
  def get(agent, onGet) do
    Agent.get(agent, onGet)
  end
  def update(agent, onUpdate) do
    Agent.update(agent, onUpdate)
  end
  def stop(agent) do
    Agent.stop(agent)
  end
end
