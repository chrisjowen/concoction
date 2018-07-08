defmodule Concoction.Http do

  defmodule Request do
    defstruct [
      method: "get",
      url: nil,
      body: nil,
      headers: []
    ]
  end
end
