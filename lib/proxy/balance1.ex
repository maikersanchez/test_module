defmodule Balance1 do
  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "amount can´t be negative"}
      true -> {:ok, spawn(__MODULE__, :listen, [initial_state])}
    end
  end

  def deposit(account, amount) do
    call(account, {:deposit, amount, self()})
    await()
  end

  def withdraw(account, amount) do
    call(account, {:deposit, amount, self()})
    await()
  end

  def call(accaunt, event) do
    send(accaunt, event)
    receive do
      amount -> amount
    end
  end

  def await do
    receive do
      count -> count
    end
  end

  def listen(state) do

    receive do
      {cmd, amount, from_id} -> {cmd, amount} |> handle_call(from_id, state) |> listen
    end
  end

  def handle_call({:deposit, amount}, from_id, state) do
    state = state + amount
    reply(from_id, state, state)
  end

  def handle_call({:withdraw, amount}, from_id, state) do
    state = state - amount
    reply(from_id, state, state)
  end

  def reply(from_id, reply, new_state) do
    send(from_id, reply)
    new_state
  end
end
