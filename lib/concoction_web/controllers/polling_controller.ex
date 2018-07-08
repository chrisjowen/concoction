defmodule ConcoctionWeb.PollingController do
    use ConcoctionWeb, :controller
    
    @fetcher Concoction.Http.Fetcher
    @request_builder Concoction.Http.DefaultRequestBuilder
    # @scheduler Concoction.Scheduler.DefaultScheduler

    def test(conn, %{"id" => id}) do
        poll = load_poll(id)

        with {:ok, request}  <-  @request_builder.build(poll.endpoint, %{params: poll.params}),
             {:ok, response} <-  @fetcher.fetch(request)     
        do
            json(conn, %{
                response: Map.merge(%{}, response),
                request: request
            })
        end
    end

    # def schedule(conn, %{"id" => id}) do
    #     @scheduler.schedule_poll(id)
    # end


    # TODO: Repo shuoldnt be in contoller
    defp load_poll(id) do
        alias Concoction.Repo
        alias Concoction.Schema.Poll
        
        Repo.get!(Poll, id) |> Repo.preload([:endpoint, :connection])
    end
end