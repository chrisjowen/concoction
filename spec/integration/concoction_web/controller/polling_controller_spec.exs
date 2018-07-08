defmodule ConcoctionWeb.PollingControllerSpec do
    use ESpec.Phoenix, controller: ConcoctionWeb.PollingController
    import Concoction.Factory
    alias Concoction.Http.Request
    alias Concoction.Http.Fetcher

    context "#test", include: true do
        before do
            allow RequestBuilder |> to(accept :build, fn(_,_) -> 
                {:ok, %Request{
                    method: :get,
                    url: "http://www.google.com",
                    body: "{}",
                    headers: []
                }}
            end)
            allow Fetcher |> to(accept :fetch, fn(_) -> 
                {:ok, :ok}
            end)
            :ok
          end


        it "will retrieve poll from database and build response" do
            conn = build_conn()
            poll = insert(:poll)
            conn 
                |> post(polling_path(conn, :test, poll.id))
                |> json_response(200)
        end
    end
end
  