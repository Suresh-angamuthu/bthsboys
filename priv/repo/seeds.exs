# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RestaurantProject.Repo.insert!(%RestaurantProject.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias RestaurantProject.Catalog.User
alias RestaurantProject.Repo

alias RestaurantProject.Catalog.Restaurant

Repo.insert(%Restaurant{
  shop_name: "Bismi Biryani",
  address: "Thiruvanmiyur",
  contact: "1111111111"
})

Repo.insert(%Restaurant{shop_name: "rain forest", address: "Adyar", contact: "2222222222"})

Repo.insert(%Restaurant{
  shop_name: "chick o chick",
  address: "Besant nagar",
  contact: "3333333333"
})

Repo.insert(%Restaurant{shop_name: "Paradise Biryani", address: "Perugudi", contact: "4444444444"})

Repo.insert(%Restaurant{
  shop_name: "Mughal Biryani",
  address: "Vannandhurai",
  contact: "5555555555"
})

Repo.insert(%Restaurant{shop_name: "Sukku Bhaai", address: "Alandur", contact: "6666666666"})

%User{}
|> User.changeset(%{
  name: "Admin",
  email_id: "admin@jewelflow.com",
  password: "123456"
})
|> Repo.insert()

%User{}
|> User.changeset(%{
  name: "suresh",
  email_id: "suresh@gmail.com",
  password: "123456"
})
|> Repo.insert()

%User{}
|> User.changeset(%{
  name: "sam",
  email_id: "sam@gmail.com",
  password: "123456"
})
|> Repo.insert()

%User{}
|> User.changeset(%{
  name: "muthu",
  email_id: "muthu@gmail.com",
  password: "123456"
})
|> Repo.insert()

%User{}
|> User.changeset(%{
  name: "ninja",
  email_id: "ninja@gmail.com",
  password: "123456"
})
|> Repo.insert()

%User{}
|> User.changeset(%{
  email_id: "suresha@gmail.com",
  password: "123456",
  name: "sj"
})
|> Repo.insert()
