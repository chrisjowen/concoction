# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :concoction,
  ecto_repos: [Concoction.Repo]

# Configures the endpoint
config :concoction, ConcoctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LAo19ju8r+mARUhFw5ebg0zyApd3A+M+coOVdk4j8zYMFM0hQx1DYPbhxvNc1PAZ",
  render_errors: [view: ConcoctionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Concoction.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]


if Mix.env == :dev do
  config :mix_test_watch, clear: true, tasks: ["espec"]
end


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
