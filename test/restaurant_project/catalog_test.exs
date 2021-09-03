defmodule RestaurantProject.CatalogTest do
  use RestaurantProject.DataCase

  alias RestaurantProject.Catalog

  describe "restaurants" do
    alias RestaurantProject.Catalog.Restaurant

    @valid_attrs %{address: "some address", contact: 42, shop_name: "some shop_name"}
    @update_attrs %{address: "some updated address", contact: 43, shop_name: "some updated shop_name"}
    @invalid_attrs %{address: nil, contact: nil, shop_name: nil}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_restaurant()

      restaurant
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Catalog.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Catalog.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Catalog.create_restaurant(@valid_attrs)
      assert restaurant.address == "some address"
      assert restaurant.contact == 42
      assert restaurant.shop_name == "some shop_name"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{} = restaurant} = Catalog.update_restaurant(restaurant, @update_attrs)
      assert restaurant.address == "some updated address"
      assert restaurant.contact == 43
      assert restaurant.shop_name == "some updated shop_name"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Catalog.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Catalog.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Catalog.change_restaurant(restaurant)
    end
  end

  describe "users" do
    alias RestaurantProject.Catalog.User

    @valid_attrs %{email_id: "some email_id", name: "some name", password: "some password", password_hash: "some password_hash"}
    @update_attrs %{email_id: "some updated email_id", name: "some updated name", password: "some updated password", password_hash: "some updated password_hash"}
    @invalid_attrs %{email_id: nil, name: nil, password: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Catalog.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Catalog.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Catalog.create_user(@valid_attrs)
      assert user.email_id == "some email_id"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Catalog.update_user(user, @update_attrs)
      assert user.email_id == "some updated email_id"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_user(user, @invalid_attrs)
      assert user == Catalog.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Catalog.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Catalog.change_user(user)
    end
  end
end
