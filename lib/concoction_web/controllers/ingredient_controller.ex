defmodule ConcoctionWeb.IngredientController do
  use ConcoctionWeb, :controller

  def index(conn, _params) do
    json conn, %{ ok: :ok}
  end
end
