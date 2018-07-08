defmodule Concoction.Http.Fetcher do
  alias Concoction.Http.Request

  @verbs %{
    "post" => :post,
    "get" => :get,
    "put" => :put,
    "delete" => :delete
  }

  def fetch(request = %Request{}) do
    response = case Map.get(@verbs, request.method) do
      nil -> {:error, "Invalid verb #{request.method}"}
      verb -> process_request(request, verb)
    end
    with %HTTPotion.Response{}=http_response <- response, do: {:ok, http_response}
  end

  def process_request(request, method) do
    apply(HTTPotion, method, [request.url, [
      headers: Enum.into(request.headers, []),
      body: request.body
    ]])
  end

end
