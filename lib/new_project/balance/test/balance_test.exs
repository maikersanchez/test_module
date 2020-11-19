defmodule BalanceTest do
  use ExUnit.Case
  doctest Balance

  test "initial amount must't be negative" do
    {:error, reason} = Balance.create(-100)
    assert reason == "amount can't be negative"
  end

  test "Default initial amount must be zero" do
    {:ok, balance} = Balance.create()
    assert Balance.read(balance) == 0
  end

  test "Creates a balance with a initial amount" do
    {:ok, balance} = Balance.create(1000)
    assert Balance.read(balance) == 1000
  end

  test "Increments amount in 200" do
    {:ok, balance} = Balance.create(1000)
    amount = Balance.deposit(balance, 200)
    assert amount == 1200
    assert Balance.read(balance) == amount
  end

  test "Decrements amount in 250" do
    {:ok, balance} = Balance.create(1300)
    amount = Balance.withdraw(balance, 250)
    assert amount == 1050
    assert Balance.read(balance) == amount
  end

end
