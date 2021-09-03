defmodule RestaurantProject.Catalog.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :email_id, :string
    field :name, :string
    field :password, :string, virtual: false
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email_id, :password, :password_hash])
    |> validate_required(:password)
    |> validate_length(:password, min: 6, max: 12)
    |> validate_confirmation(:password,
      message: "does not match password"
    )
    |> hash_password()
    |> unique_constraint(:email_id, message: "User already created for this email!")
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      put_change(changeset, :password_hash, hashpwsalt(password))
    else
      changeset
    end
  end
end
