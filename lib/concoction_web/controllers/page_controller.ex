defmodule ConcoctionWeb.PageController do
  use ConcoctionWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
