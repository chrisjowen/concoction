defmodule Concoction.Trigger.Fetcher do
    def build(spec), do: &fetch(&1, spec)
    def fetch(options, %{method: method, endpoint: endpoint, auth: auth}) do
      options = [
        headers: auth_header(auth),
        body: body(options),
      ]
      apply(HTTPotion, method,[interpolate_endpoint(endpoint, options), options])
    end
    defp auth_header(%{mode: :basic, credentials: _credentials}), do: ["Authorization": "123123123"]
    defp auth_header(_no_auth), do: []
    defp interpolate_endpoint(endpoint, _), do: endpoint
    defp body([body: body]) when is_map(body), do:  Poison.encode(body)
    defp body(_), do:  nil
  end
