defmodule ObservableTest do
  use ExUnit.Case
  doctest Observable

  test "Intial observable create array empty" do
    {:ok, subject} = Observable.create()

    assert Map.get(subject, :observers) == []
  end
end
