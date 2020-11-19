defmodule Observable do
  @spec create(integer()) :: pid()
  def create(intialState \\ 0) do
    spawn(__MODULE__, :listen, [[], intialState])
  end

  defp listen(observers, state) do
    receive do
      {:attach, observer_pid} ->
        observers |> add_observer(observer_pid) |> listen(state)

      {:detach, observer_pid} ->
        observers |> remove_observer(observer_pid) |> listen(state)

      {:increment} ->
        new_state = state + 1
        notify(observers, new_state)
        listen(observers, state)

      {:decrement} ->
        new_state = state - 1
        notify(observers, new_state)
        listen(observers, state)

      {:read, reader_pid} ->
        send(reader_pid, state)
        listen(observers, state)
    end
  end

  defp add_observer(observers, observer_pid) do
    [observer_pid | observers]
  end

  defp remove_observer(observers, observer_pid) do
    observers -- [observer_pid]
  end

  #   def read(subject) do
  #     send(subject, {:read, self()})
  #     await()
  #   end

  defp notify(observer, state) do
    observer |> Enum.each(&send(&1, state))
  end

  def attach(subject) do
    send(subject, {:attach, self()})
  end

  def detach(subject) do
    send(subject, {:detach, self()})
  end

  # def detach(observer_pid)
  def increment(subject) do
    send(subject, {:increment})
  end

  def decrement(subject) do
    send(subject, {:decrement})
  end

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await() do
    receive do
      count -> count
    end
  end
end
