defmodule Concoction.Factory do
    use ExMachina.Ecto, repo: Concoction.Repo
    alias Concoction.Schema.{Endpoint, Connection, Poll}

    def endpoint_factory do
      %Endpoint{
        name: "Test API Call",
        description: "Calls a test api",
        method: "post",
        url_template: "http://localhost:4000/api/{{url_param}}",
        body_template:  "{\"body_param\": \"{{body_param}}\", \"foo\": \"{{foo}}\"}",
        headers: %{"User-Agent" => "My App", "Content-Type" => "application/json" },
        auth_type: "BASIC",
      }
    end

    def credentials_factory do
      %Connection.Credentials{
        username: "Hello",
        password: "goodbye"
      }
    end

    def connection_factory do
      %Connection{
        auth_type: "BASIC",
        credentials: build(:credentials)
      }
    end

    def poll_factory do
      %Poll{
        schedule: "* * * */1",
        params: %{ "url_param" => "test", "body_param" => "body_param_value", "foo" => "bar"},
        connection: build(:connection),
        endpoint: build(:endpoint)
      }
    end
end

