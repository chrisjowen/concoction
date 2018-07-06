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


config :ueberauth, Ueberauth,
  providers: [
     github: {Ueberauth.Strategy.Github, []},
     facebook: {Ueberauth.Strategy.Facebook, []},
     active_directory: {Ueberauth.Strategy.ActiveDirectory, []}
  ]

 config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.ActiveDirectory.Ldap,
  server: "ukpkrdom103.zone1.scb.net",
  port: 389,
  ssl: false,
  base_dn: "OU=Accounts,OU=ITSC,DC=zone1,DC=scb,DC=net",
  user_dn: "vx.ldaps",
  password: "i3UfDq0GqI8wE"

# config :concoction,
#   deps:
#     template_renderer: Concoction.LiquidTemplateRenderer


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
