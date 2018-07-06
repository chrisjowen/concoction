defmodule Concoction.Http.Fetcher do
  alias Concoction.Http.{Request, AuthOptions}

  def fetch(options = %Request{}) do
    apply(HTTPotion, options.method, [options.url, [
      headers: options.headers,
      body: options.body
    ]])
  end
end
