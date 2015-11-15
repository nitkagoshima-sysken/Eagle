defmodule Eagle.PageController do
  use Eagle.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
