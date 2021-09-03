defmodule RestaurantProject.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :shop_name, :string
      add :address, :string
      add :contact, :string

      timestamps()
    end

  end
end
