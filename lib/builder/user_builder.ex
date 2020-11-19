defmodule UserBuilder do

  def create do
    %User{}
  end

  def name(user, name, firts_name) do
    Map.put(user,"name", name <> firts_name)
  end

  def country(user, country) do
    Map.put(user,"country", country)
  end

  def lenguajes(user, lenguajes) do
    Map.put(user,"lenguajes", lenguajes)
  end

  def programing_lenguajes(user, programing) do
    Map.put(user,"programing_lenguajes", programing)
  end


end
