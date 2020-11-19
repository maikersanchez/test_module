defmodule HelloWeb.HolaController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "hola.html")
  end

  # def hola(conn, _params) do
  #   render(conn, "hola.html")
  # end
end
