defmodule RestaurantProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RestaurantProject.Repo,
      # Start the Telemetry supervisor
      RestaurantProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RestaurantProject.PubSub},
      # Start the Endpoint (http/https)
      RestaurantProjectWeb.Endpoint
      # Start a worker by calling: RestaurantProject.Worker.start_link(arg)
      # {RestaurantProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RestaurantProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RestaurantProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
