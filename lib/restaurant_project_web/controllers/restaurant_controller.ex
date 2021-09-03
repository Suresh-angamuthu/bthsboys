defmodule RestaurantProjectWeb.RestaurantController do
  use RestaurantProjectWeb, :controller

  alias RestaurantProject.Catalog
  alias RestaurantProject.Catalog.Restaurant

  action_fallback RestaurantProjectWeb.FallbackController

  def index(conn, _params) do
    restaurants = Catalog.list_restaurants()
    render(conn, "index.json", restaurants: restaurants)
  end

  def create(conn, %{"restaurant" => restaurant_params}) do
    case Catalog.create_restaurant(restaurant_params) do
      {:ok, %Restaurant{} = restaurant} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.restaurant_path(conn, :show, restaurant))
        |> render("show.json", restaurant: restaurant)

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def show(conn, %{"id" => id}) do
    case Catalog.get_restaurant(id) do
      {:ok, restaurant} ->
        render(conn, "show.json", restaurant: restaurant)

      {:error, message} ->
        {:error, message}
    end
  end

  def update(conn, %{"id" => id, "restaurant" => restaurant_params}) do
    case Catalog.get_restaurant(id) do
      {:ok, restaurant} ->
        case Catalog.update_restaurant(restaurant, restaurant_params) do
          {:ok, %Restaurant{} = restaurant} ->
            render(conn, "show.json", restaurant: restaurant)

          {:error, changeset} ->
            {:error, changeset}
        end

      {:error, message} ->
        {:error, message}
    end
  end

  def delete(conn, %{"id" => id}) do
    case Catalog.get_restaurant(id) do
      {:ok, restaurant} ->
        case Catalog.delete_restaurant(restaurant) do
          {:ok, %Restaurant{}} ->
            json(conn, %{message: "Id #{id} is deleted successfully"})

          {:error, changeset} ->
            {:error, changeset}
        end

      {:error, message} ->
        {:error, message}
    end
  end
end
