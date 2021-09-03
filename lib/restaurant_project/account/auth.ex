defmodule RestaurantProject.Account.Auth do
  alias RestaurantProject.Catalog

  def authenticate(email, password) do
    user = Catalog.get_user_by_email(email)

    if is_nil(user) do
      {:error, "Invalid Credentials"}
    else
      case check_password(user, password) do
        false -> {:error, "Invalid Credentials"}
        _ -> {:ok, user}
      end
    end
  end

  defp check_password(nil, _) do
    false
  end

  defp check_password(user, password) do
    Comeonin.Bcrypt.checkpw(password, user.password_hash)
  end
end
