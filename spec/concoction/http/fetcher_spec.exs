defmodule Concoction.Http.FetcherSpec do
    use ESpec
    require Logger
    alias Concoction.Http.{Fetcher, Request}

    let :endpoint, do: "http://www.google.com"
    let :spec, do: %Request{ url: endpoint() }

    before do
      print = true
      allow HTTPotion |> to(accept :post, &recieved(&1, &2, :post, print))
      allow HTTPotion |> to(accept :get, &recieved(&1, &2, :get, print))
      :ok
    end

    it "Should get without auth from spec" do
      spec = spec()

      Fetcher.fetch(spec)
      expect(HTTPotion) |> to(accepted(:get, [endpoint(), [headers: [], body: nil]]))
    end


    it "Should post if specified" do
      spec = put_in(spec().method, "post")

      Fetcher.fetch(spec)
      expect(HTTPotion) |> to(accepted(:post, [endpoint(), [headers: [], body: nil]]))
    end


    defp recieved(url, options, method,  print) do
      if(print) do
        verb = Atom.to_string(method) |> String.upcase
        Logger.info("URL: #{url}, VERB: #{verb} OPTIONS: #{inspect(options)}")
      end
    end
  end
