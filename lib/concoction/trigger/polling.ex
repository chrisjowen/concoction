defmodule Conconction.Trigger.Polling do
    def build(spec), do: &poll(&1, spec)
    defp poll(options, %{method: method, endpoint: endpoint, auth: auth}) do
      options = [
        headers: auth_header(auth),
        body: body(options)
      ]
      HTTPotion |> apply(method, options)
    end
    defp auth_header(%{mode: :basic, credentials: credentials}), do: ["Authorization": "123123123"]
    defp auth_header(_no_auth), do: []
    defp interpolate_endpoint(endpoint, _), do: endpoint
    defp body([body: body]) when is_map(body), do:  Posion.encode(body)
    defp body(_) do:  nil
  end
