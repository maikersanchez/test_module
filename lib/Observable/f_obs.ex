defmodule FObs do
  @spec create(integer()) :: pid()
  def create(intialState \\ 0) do
    spawn(__MODULE__, :listen, [[], intialState])
  end

  def listen(observers, state) do
    receive do
      event ->
        {observers, state} = on_event(event, observers, state)
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

  defp notify(observers, state) do
    observers |> Enum.each(&send(&1, state))
    {observers, state}
  end


  def attach(subject) do
    send(subject, {:attach, self()})
  end

  def detach(subject) do
    send(subject, {:detach, self()})
  end

  # def detach(observer_pid)
  # def increment(subject) do
  #   send(subject, {:increment})
  # end

  # def decrement(subject) do
  #   send(subject, {:decrement})
  # end

  def read(subject) do
    send(subject, {:read, self()})
    await()
  end

  def await() do
    receive do
      count -> count
    end
  end

  #base implementation
  def on_event({:attach, observer_pid}, observers, state) do
    {observers |> add_observer(observer_pid), state}
  end

  def on_event({:detach, observer_pid}, observers, state) do
    {observers |> remove_observer(observer_pid), state}
  end

  def on_event({:read, reader_pid}, observers, state) do
    send(reader_pid, state)
    {observers, state}
  end

  ## Extending
  def on_event({:increment}, observers, state) do
    notify(observers, state + 1)
  end

  def on_event({:decrement}, observers, state) do
    notify(observers, state - 1)
  end

  def increment(subject), do: send(subject, {:increment})
  def decrement(subject), do: send(subject, {:decrement})


end
