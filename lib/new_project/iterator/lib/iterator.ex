defmodule Iterator do

  def init(state) do
    {:ok, state}
  end

  def new(list, index \\ 0) do
    GenServer.start_link(__MODULE__, {list, index})
  end

  def next?(pid), do: GenServer.call(pid, :next?)

  def next(pid), do: GenServer.call(pid, :next)

  def handle_call(:next, _from, {list, index}) do
    {:reply, Enum.at(list, index), {list, index + 1}}
  end


  def handle_call(:next?, _from, {list, index}) do
    {:reply,
    # not is_nil Enum.at(list, index)
    not(list |> Enum.at(index) |> is_nil),
    {list, index}
  }
  end
end
