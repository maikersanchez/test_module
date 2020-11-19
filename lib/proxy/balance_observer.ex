defmodule BalanceObserver do
  def create(initial_state \\ 0) do
    {:ok, spawn(__MODULE__, :listen, [initial_state])}
  end

  def deposit(account, amount) do
    send(account, {:deposit, amount, self()})
    await()
  end

  def withdraw(account, amount) do
    send(account, {:deposit, amount, self()})
    await()
  end

  def await do
    receive do
      count -> count
    end
  end

  def listen(state) do

    receive do
      {cmd, amount, from_pid} ->
        state = on_event({cmd, amount}, state)
        send(from_pid, state)
        listen(state)
    end
  end

  def on_event({:deposit, amount}, state) do
    state + amount
  end

  def on_event({:withdraw, amount}, state) do
    state - amount
  end
end
