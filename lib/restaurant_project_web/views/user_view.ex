defmodule RestaurantProjectWeb.UserView do
  use RestaurantProjectWeb, :view
  alias RestaurantProjectWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email_id: user.email_id,
      password: user.password,
      password_hash: user.password_hash}
  end
end
