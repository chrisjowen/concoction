defmodule Concoction.Http do

  defmodule AuthSpec do
    defstruct [
      mode: :none,
      credentials_key: nil,
      options: []
    ]
  end

  defmodule RequestSpec do
    defstruct [
      method: :get,
      auth_spec: %Concoction.Http.AuthSpec{},
      url_template: "",
      body_template: "",
      headers: []
    ]
  end


  defmodule Request do
    defstruct [
      method: :get,
      url: nil,
      body: nil,
      headers: []
    ]
  end
end
