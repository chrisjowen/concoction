defmodule Conconction.Trigger.PollingSpec do
    use ESpec
    alias Conconction.Trigger.Polling
  
    let :polling_spec do
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
  
    it "Should create polling function from specification" do
      spec = polling_spec()
  
      allow HTTPotion |> to(accept :get, fn(url, _options) ->
          expect(url) |> to(be(spec.endpoint))
      end)
  
      poll = Polling.build(spec)
      poll.([]) 
    end
  
  end