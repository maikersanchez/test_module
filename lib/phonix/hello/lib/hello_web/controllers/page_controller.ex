defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  # def hola(conn, _params) do
  #   render(conn, "hola.html")
  # end
end
