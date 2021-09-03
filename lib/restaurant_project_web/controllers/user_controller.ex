defmodule RestaurantProjectWeb.UserController do
  use RestaurantProjectWeb, :controller

  alias RestaurantProject.Catalog
  alias RestaurantProject.Catalog.User

  action_fallback RestaurantProjectWeb.FallbackController

  def index(conn, _params) do
    users = Catalog.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    case Catalog.create_user(user_params) do
      {:ok, %User{} = user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def show(conn, %{"id" => id}) do
    case Catalog.get_user(id) do
      {:ok, user} ->
        render(conn, "show.json", user: user)

      {:error, message} ->
        {:error, message}
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    case Catalog.get_user(id) do
      {:ok, user} ->
        case Catalog.update_user(user, user_params) do
          {:ok, %User{} = user} ->
            render(conn, "show.json", user: user)

          {:error, changeset} ->
            {:error, changeset}
        end

      {:error, message} ->
        {:error, message}
    end
  end

  def delete(conn, %{"id" => id}) do
    case Catalog.get_user(id) do
      {:ok, user} ->
        case Catalog.delete_user(user) do
          {:ok, %User{}} ->
            json(conn, %{message: "Id #{id} is deleted successfully"})

          {:error, changeset} ->
            {:error, changeset}
        end

      {:error, message} ->
        {:error, message}
    end
  end
end
