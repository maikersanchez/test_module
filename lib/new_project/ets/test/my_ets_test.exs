defmodule MyEtsTest do
  use ExUnit.Case
  doctest MyEts

  test "writes a key with one values" do
    table = :ets.new(:my_bucket, [:set, :protected])
    :ets.insert(table, {"perro", "dog"})
    assert [{"perro", "dog"}] == :ets.lookup(table, "perro")
    assert [] == :ets.lookup(table, "dog")
  end

  test "writes a key with two values" do
    table = :ets.new(:my_bucket, [:set, :protected])
    :ets.insert(table, {"perro", "dog"})
    :ets.insert(table, {"perro", "Hund"})
    assert [{"perro", "Hund"}] == :ets.lookup(table, "perro")
    assert [] == :ets.lookup(table, "dog")
    assert [] == :ets.lookup(table, "Hund")
  end

  test "save a valuie it is no in the ETS" do
    table = :ets.new(:my_bucket, [:set, :protected])
    key = "like"
    assert :ets.lookup(table, key) == []
    {:new, 0} = read_value(table, key)
    {:already, 0} = read_value(table, key)
    assert update_data_from_db(table, key) == 1
    assert update_data_from_db(table, key) == 2
  end

  def read_value(table, key) do
    value = :ets.lookup(table, key)

    if value == [] do
      new_value = read_data_from_db()
      :ets.insert(table, {key, new_value})
      {:new, new_value}
    else
      {:already, value |> Enum.at(0) |> elem(1)}
    end
  end

  def read_data_from_db do
    0
  end

  def update_data_from_db(table, key) do
    {_, value} = read_value(table, key)
    new_value = value + 1
    # you should write the db
    :ets.insert(table, {key, new_value})
    new_value
  end

end
