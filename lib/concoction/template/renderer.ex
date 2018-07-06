defmodule Concoction.Template.Renderer do
  @callback render(String.t, Map.t) :: String.t
end
