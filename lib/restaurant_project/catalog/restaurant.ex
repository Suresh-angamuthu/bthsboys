defmodule RestaurantProject.Catalog.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :address, :string
    field :contact, :string
    field :shop_name, :string

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:shop_name, :address, :contact])
    |> validate_required([:shop_name, :address, :contact])
  end
end
