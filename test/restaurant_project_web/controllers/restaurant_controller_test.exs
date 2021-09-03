defmodule RestaurantProjectWeb.RestaurantControllerTest do
  use RestaurantProjectWeb.ConnCase

  alias RestaurantProject.Catalog
  alias RestaurantProject.Catalog.Restaurant

  @create_attrs %{
    address: "some address",
    contact: 42,
    shop_name: "some shop_name"
  }
  @update_attrs %{
    address: "some updated address",
    contact: 43,
    shop_name: "some updated shop_name"
  }
  @invalid_attrs %{address: nil, contact: nil, shop_name: nil}

  def fixture(:restaurant) do
    {:ok, restaurant} = Catalog.create_restaurant(@create_attrs)
    restaurant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all restaurants", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create restaurant" do
    test "renders restaurant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.restaurant_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some address",
               "contact" => 42,
               "shop_name" => "some shop_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update restaurant" do
    setup [:create_restaurant]

    test "renders restaurant when data is valid", %{conn: conn, restaurant: %Restaurant{id: id} = restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.restaurant_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some updated address",
               "contact" => 43,
               "shop_name" => "some updated shop_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, restaurant: restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete restaurant" do
    setup [:create_restaurant]

    test "deletes chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = delete(conn, Routes.restaurant_path(conn, :delete, restaurant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.restaurant_path(conn, :show, restaurant))
      end
    end
  end

  defp create_restaurant(_) do
    restaurant = fixture(:restaurant)
    %{restaurant: restaurant}
  end
end
