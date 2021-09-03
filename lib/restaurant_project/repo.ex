defmodule RestaurantProject.Repo do
  use Ecto.Repo,
    otp_app: :restaurant_project,
    adapter: Ecto.Adapters.Postgres
end
