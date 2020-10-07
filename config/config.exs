# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ms_abac,
  ecto_repos: [MsAbac.Repo]

# Configures the endpoint
config :ms_abac, MsAbacWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7tgmsh5qpvautUUSPbRUCbJrv1rgtNhfO6px/HY1iNgwicddrS2reiFgirqRXJw9",
  render_errors: [view: MsAbacWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MsAbac.PubSub,
  live_view: [signing_salt: "n7NHpaNP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
