defmodule Concoction.Template.LiquidRenderer do
  @behaviour Concoction.Template.Renderer

  alias Liquid.Template

  def render(input, params) when is_map(params) do
    with tpl <- Template.parse(input),
      { :ok, rendered, _ } <- Template.render(tpl, params)
    do
      { :ok, rendered }
    end
  end
end
