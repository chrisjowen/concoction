defmodule Concoction.Http.RequestBuilder do
  alias Concoction.Http.Request
  alias Concoction.Schema.Endpoint
  @callback build(Endpoint.t, Map.t) :: Request.t
end

defmodule Concoction.Http.DefaultRequestBuilder do
  alias Concoction.Http.Request
  alias Concoction.Schema.Endpoint
  @behaviour Concoction.Http.RequestBuilder

  # TODO: This should come from config
  @renderer Concoction.Template.LiquidRenderer

  def build(spec = %Endpoint{}, options) do
    with {:ok, url} <- make_url(spec.url_template, options),
         {:ok, body} <- make_body(spec.body_template, options)
      do
        request = authorize(%Request{
          method: spec.method,
          url: URI.encode(url),
          body: body,
          headers: spec.headers
        }, spec, options)
        {:ok, request}
    end
  end

  defp make_url(url, %{params: params}), do: @renderer.render(url, params)
  defp make_body(body, options) when is_map(body), do: make_body(Poison.encode(body), options)
  defp make_body(body, %{params: params}), do: @renderer.render(body, params)
  defp authorize(request, _spec, _options), do: request
end

