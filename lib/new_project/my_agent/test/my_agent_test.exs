defmodule MyAgentTest do
  use ExUnit.Case
  doctest MyAgent

  test "Creates initial MyAgent" do
    {:ok, pid} = MyAgent.start([])
    assert pid != nil
    assert MyAgent.read(pid) == []
  end

  test "Cheks function updates MyAgent" do
    {:ok, pid} = MyAgent.start(0)
    assert pid != nil
    hfunc = fn state -> state + 3*5 end
    MyAgent.update(pid, hfunc)
    assert MyAgent.read(pid) == 15
  end

  test "Close MyAgent and get my last state" do
    {:ok, pid} = MyAgent.start(["maria", "andres", "fulanito"])
    assert pid != nil
    assert length(MyAgent.close(pid)) == 3
    # assert length(MyAgent.close(pid)) == nil
  end

end
