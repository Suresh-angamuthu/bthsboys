defmodule RestaurantProject.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email_id, :string
      add :password, :string
      add :password_hash, :string

      timestamps()
    end
    create(index(:users, [:email_id], unique: true))

  end
end
