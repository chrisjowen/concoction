defmodule Concoction.Factory do
    use ExMachina.Ecto, repo: Concoction.Repo
    alias Concoction.Schema.{Endpoint, Connection, Poll, Action, ActionPoll}

    def endpoint_factory do
      %Endpoint{
        name: "Test API Call",
        description: "Calls a test api",
        method: "post",
        url_template: "http://localhost:4000/api/test",
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
        # user:  
        schedule: "* * * */1",
        params: %{ "url_param" => "test", "body_param" => "body_param_value", "foo" => "bar"},
        action: build(:action)
      }
    end

    def action_factory do
      %Action{
        connection: build(:connection),
        endpoint: build(:endpoint),
        parent: nil
      }
    end
    
end

