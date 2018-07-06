defmodule Concoction.Trigger.FetcherSpec do
    use ESpec
    alias Concoction.Trigger.Fetcher
  
    let :spec do
      %{
        endpoint: "http://www.google.com",
        auth: %{
          mode: :basic,
          credentials: []
        },
        interval: "* * */2",
        method: :get
      }
    end
  
    it "Should create function from specification" do
      spec = spec()
      allow HTTPotion |> to(accept :get, fn(url, _options) ->
          expect(url) |> to(be(spec.endpoint))
      end)
  
      fetch_fun = Fetcher.build(spec)
      fetch_fun.([]) 
    end
  
  end