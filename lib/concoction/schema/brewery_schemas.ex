defmodule Concoction.Schema do

    defmodule Endpoint do
        use Ecto.Schema

        schema "endpoints" do
            field :name             , :string
            field :description      , :string
            field :method           , :string
            field :url_template     , :string
            field :body_template    , :string
            field :headers          , :map
            field :auth_type        , :string
            timestamps()
        end
    end

    defmodule Connection do
        use Ecto.Schema

        schema "connections" do
            field :auth_type    , :string
            embeds_one :credentials, Credentials, on_replace: :update do
                field(:username, :string)
                field(:password, :string)
            end
            embeds_one :options, Options, on_replace: :update do
                field(:callback_url, :string)
            end
            timestamps()
        end
    end

    defmodule Poll do
        use Ecto.Schema

        schema "polls" do
            field :schedule                     , :string 
            field :params                       , :map 
            belongs_to :connection              , Concoction.Schema.Connection
            belongs_to :endpoint                , Concoction.Schema.Endpoint
            timestamps()
        end
    end

end