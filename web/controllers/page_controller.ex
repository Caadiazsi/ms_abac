defmodule MsAbac.PageController do
  use MsAbac.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
