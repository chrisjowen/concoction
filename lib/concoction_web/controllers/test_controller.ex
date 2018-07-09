defmodule ConcoctionWeb.TestController do
  use ConcoctionWeb, :controller
 
  def index(conn, params) do
    json(conn, params)
  end

end
