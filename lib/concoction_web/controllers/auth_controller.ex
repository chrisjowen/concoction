defmodule ConcoctionWeb.AuthController do
  @moduledoc """
  Auth controller responsible for handling Ueberauth responses
  """
  use ConcoctionWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    # assign(conn,
    redirect(conn, to: "/auth/active_directory/callback")
  end


  def callback(%{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    IO.inspect(fails)
    json(conn, %{status: :failed})
  end

  def callback( conn, _params) do
     IO.inspect(conn)
     json(conn, %{reponse: :ok})
  end


end
