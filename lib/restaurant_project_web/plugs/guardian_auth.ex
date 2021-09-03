defmodule RestaurantProjectWeb.Plugs.GuardianAuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :restaurant_project,
    module: RestaurantProject.Guardian,
    error_handler: RestaurantProjectWeb.Plugs.AuthErrorHandler

  plug(Guardian.Plug.VerifyHeader)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource, ensure: true)
end
