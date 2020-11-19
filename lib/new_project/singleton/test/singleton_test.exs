defmodule SingletonTest do
  use ExUnit.Case
  doctest Singleton

  test "create singleton" do
    Singleton.start_link("Hello")
    assert Singleton.read == "Hello"
    assert Singleton.write("Hello") == :ok
    assert Singleton.read == "Hello"
  end

  test "Multiple declaration" do
    {:ok, single_pid} = Singleton.start_link("Hello")
    {:error, {:already_started, ^single_pid}} = Singleton.start_link("Hello")
    assert Singleton.read() == "Hello"
  end
end
