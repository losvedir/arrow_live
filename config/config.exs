# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :arrow_live,
  ecto_repos: [ArrowLive.Repo]

# Configures the endpoint
config :arrow_live, ArrowLiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WlWi/txRXCUBF5dt2CeL89X7rBEJNryyxOCopPSsDLMfJSLXL5uChi8U4SfdCdVT",
  render_errors: [view: ArrowLiveWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ArrowLive.PubSub,
  live_view: [signing_salt: "0tulXfDg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
