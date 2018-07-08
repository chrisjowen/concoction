defmodule Concoction.Http.RequestBuilderSpec do
    use ESpec
    require Logger

    alias Concoction.Http.DefaultRequestBuilder
    alias Concoction.Schema.Endpoint

    let :params, do: %{ "query" => "some thing" }
    let :endpoint, do: %Endpoint{
      url_template: "http://www.google.com/?q={{query}}"
    }

    it "Should build url" do
      {:ok, request} = DefaultRequestBuilder.build(endpoint(), %{params: params()})
      request.url |> should(be("http://www.google.com/?q=some%20thing"))
    end
  end