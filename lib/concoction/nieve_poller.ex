# Super nieve, using 
defmodule Concoction.NievePolling do
    alias Concoction.Repo
    alias Concoction.Schema.Poll
    require Logger

    @fetcher Concoction.Http.Fetcher
    @request_builder Concoction.Http.DefaultRequestBuilder

    def tick() do
        Logger.info "Tick"
        Repo.all(Poll) |> Repo.preload([:endpoint, :connection]) |> Enum.each(&process/1)    
    end

    defp process(poll) do
        Task.async(fn -> 
            with {:ok, request}  <-  @request_builder.build(poll.endpoint, %{params: poll.params}),
                 {:ok, response} <-  @fetcher.fetch(request)     
            do
                %{
                    response: Map.merge(%{}, response),
                    request: request
                }
            end |> inspect |> Logger.info
        end)
    end

end

defmodule Concoction.Scheduler do
    use Quantum.Scheduler,
      otp_app: :concoction
  end