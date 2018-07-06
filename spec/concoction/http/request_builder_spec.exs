defmodule Concoction.Http.RequestBuilderSpec do
    use ESpec
    require Logger

    alias Conconction.Http.DefaultRequestBuilder
    alias Concoction.Http.{RequestSpec}

    it "Should build url" do
      params = %{
        "query" => "some thing"
      }
      spec = %RequestSpec{
        url_template: "http://www.google.com/?q={{query}}"
      }
      request = DefaultRequestBuilder.build(spec, %{params: params})
      request.url |> should(be("http://www.google.com/?q=some%20thing"))
    end

  end
