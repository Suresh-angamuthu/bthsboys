defmodule RestaurantProjectWeb.RestaurantView do
  use RestaurantProjectWeb, :view
  alias RestaurantProjectWeb.RestaurantView

  def render("index.json", %{restaurants: restaurants}) do
    %{data: render_many(restaurants, RestaurantView, "restaurant.json")}
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{data: render_one(restaurant, RestaurantView, "restaurant.json")}
  end

  def render("restaurant.json", %{restaurant: restaurant}) do
    %{id: restaurant.id,
      shop_name: restaurant.shop_name,
      address: restaurant.address,
      contact: restaurant.contact}
  end
end
