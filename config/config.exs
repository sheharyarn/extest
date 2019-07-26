# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :extest,
  ecto_repos: [Extest.Repo]

# Configures the endpoint
config :extest, ExtestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BBkMECyXZYKVddjmeTfIZ/R3g+n9Q22atFCvn4Nny8XMmKTP29x0ZmEMwdMnU+1a",
  render_errors: [view: ExtestWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Extest.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
