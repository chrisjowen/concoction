defmodule Concoction.Template.LiquidRendererSpec do
    use ESpec
    require Logger
    alias Concoction.Template.LiquidRenderer
    it "Should render variables" do
      "Hello {{name}}"
        |> LiquidRenderer.render(%{"name" => "Chris"})
        |> should(be({:ok, "Hello Chris"}))
    end

  end
