defmodule GsBalance do
  use GenServer

  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can´t be negative"}
      true -> GenServer.start_link(__MODULE__, initial_state)
    end
  end

  def init(state), do: {:ok, state}

  def deposite(balance, amount) do
    GenServer.call(balance, {:deposit, amount})
  end

  def withdraw(balance, amount) do
    GenServer.call(balance, {:withdraw, amount})
  end

  def handle_call({:deposit, amount}, _from_id, state) do
    state = state + amount
    {:reply, state, state}
  end

  def handle_call({:withdraw, amount}, _from_id, state) do
    state = state - amount
    {:reply, state, state}
  end
end
