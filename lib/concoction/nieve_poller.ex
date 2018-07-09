# Super nieve, using 
defmodule Concoction.NievePolling do
    alias Concoction.Repo
    alias Concoction.Schema.Poll
    require Logger

    @fetcher Concoction.Http.Fetcher
    @request_builder Concoction.Http.DefaultRequestBuilder

    def tick() do
        Logger.info "Tick"
        polls = Repo.all(Poll) |> Repo.preload([:action]) 
        polls |> Enum.each(fn poll -> process_action(poll.action, %{params: poll.params } ) end)    
    end
    
    defp process_action(action, %{params: params } = context) do
        IO.inspect("context:")
        IO.inspect(context)


        Task.async(fn -> 
            action =  Repo.preload(action, [:endpoint, :connection, :children]) 
            with {:ok, request}  <-  @request_builder.build(action.endpoint, %{params: params}),
                 {:ok, response} <-  @fetcher.fetch(request)     
            do
                result = %{
                    meta: %{
                        context: context,
                        response: response,
                        request: request
                    },
                    params: Map.merge(%{}, response),
                }
                action.children |> Enum.each(&process_action(&1, result))
            end 
        end)
    end

end







defmodule Concoction.Scheduler do
    use Quantum.Scheduler,
      otp_app: :concoction
  end