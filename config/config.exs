# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :restaurant_project,
  ecto_repos: [RestaurantProject.Repo]

# Configures the endpoint
config :restaurant_project, RestaurantProjectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r20i6/Sc0WLzbeRyslxWkAu0kS955KNvbg6qOUnMcuIOVKaKGfAyex/fH0OJ5wsU",
  render_errors: [view: RestaurantProjectWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RestaurantProject.PubSub,
  live_view: [signing_salt: "WrHnF2N8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :restaurant_project, RestaurantProject.Guardian,
  issuer: "restaurant_project",
  secret_key: "w05Bl9Fo9JJCqGXuNhDhoXZaOFhqgzZyTBjP99hn5ZLLuI6ZZFo3CE9JnIaXQBlm"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
