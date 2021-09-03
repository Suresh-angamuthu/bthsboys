defmodule RestaurantProjectWeb.SessionController do
  use RestaurantProjectWeb, :controller
  alias RestaurantProject.Account.Auth

  action_fallback RestaurantProjectWeb.FallbackController

  def login(conn, %{"email" => email_id, "password" => password}) do
    case Auth.authenticate(email_id, password) do
      {:ok, user} ->
        conn = RestaurantProject.Guardian.Plug.sign_in(conn, user)

        render(conn, "success.json", %{
          user: user,
          token: RestaurantProject.Guardian.Plug.current_token(conn)
        })

      {:error, message} ->
        {:error, message}
    end
  end

  def logout(conn, _params) do
    jwt = RestaurantProject.Guardian.Plug.current_token(conn)
    {:ok, _claims} = RestaurantProject.Guardian.revoke(jwt)

    json(conn, %{message: "Logout Success"})
  end
end
