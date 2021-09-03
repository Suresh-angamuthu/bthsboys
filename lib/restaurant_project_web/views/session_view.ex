defmodule RestaurantProjectWeb.SessionView do
  use RestaurantProjectWeb, :view
  # alias RestaurantProject.Catalog.User

  def render("success.json", %{token: token, user: user}) do
    %{result: "success", token: token, user: parse_user(user)}
  end

  def render("failure.json", _params) do
    %{result: "failed"}
  end

  def parse_user(user) do
    %{email_id: user.email_id, name: user.name}
  end
end
