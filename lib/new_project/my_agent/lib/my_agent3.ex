defmodule MyAgent3 do
  use GenServer

  def start_link(on_create) when not is_nil(on_create) do
    try do
      GenServer.start_link(__MODULE__, on_create)
    rescue
      e -> {:error, e}
    end
  end

  def init(state), do: {:ok, state}

  def get(agent, on_get) do
    GenServer.call(agent, :read)
    |> on_get.()
  end

  def update(agent, on_update) do
    GenServer.call(agent, {:update, on_update})
  end

  def stop(agent) do
    GenServer.stop(agent)
  end

  def handle_call({:update, on_update}, from_id, state) do
    {
      :reply,
      :ok,
      state
      |> on_update.()
    }
  end
end

# test "Raises an error on start" do
#   reason = "some reason"
#   {:error, e} = MyAgent.start_link(fn -> raise reason end)
#   assert e.__struct__ == RuntimeError
#   assert e.message == reason
# end
