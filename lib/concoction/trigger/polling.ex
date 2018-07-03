defmodule Conconction.Trigger.Polling do
    def build(spec) do
      &poll(&1, spec)
    end
  
    defp poll(options, %{method: :get, endpoint: endpoint, auth: auth}) do
      HTTPotion.get(interpolate_endpoint(endpoint, options), [headers: auth_header(auth)])
    end
  
    defp poll(options, %{method: :post, endpoint: endpoint, auth: auth}) do
      HTTPotion.post(interpolate_endpoint(endpoint, options), [headers: auth_header(auth), body: body(options)])
    end
  
    defp poll(options, %{method: :put, endpoint: endpoint, auth: auth}) do
      HTTPotion.put(endpoint, [headers: auth_header(auth), body: body(options)])
    end
  
  
    defp auth_header(%{mode: :basic, credentials: credentials}), do: ["Authorization": "123123123"]
    defp auth_header(_no_auth), do: []
  
    defp interpolate_endpoint(endpoint, _), do: endpoint
    defp body(options) do
      case options do
        [body: body] when is_map(body) -> Poision.encode(body)
        [body: body]  -> body
        _ -> nil
      end
    end
  end
  