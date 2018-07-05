defmodule ESpec.Phoenix.Extend do
  def schema do
    quote do
      alias Concoction.Repo
    end
  end

  def controller do
    quote do
      alias Concoction
      alias ConcoctionWeb
      import ConcoctionWeb.Router.Helpers

      @endpoint ConcoctionWeb.Endpoint
    end
  end

  def view do
    quote do
      import ConcoctionWeb.Router.Helpers
    end
  end

  def channel do
    quote do
      alias Concoction.Repo

      @endpoint ConcoctionWeb.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
