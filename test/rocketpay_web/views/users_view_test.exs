defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.Account
  alias Rocketpay.User
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Gustavo",
      password: "123456",
      nickname: "MagoDosFoguetes",
      email: "semtempopradormir@gmail.com",
      age: 21
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
          },
        id: user_id,
        name: "Gustavo",
        nickname: "MagoDosFoguetes"
      }
    }

    assert expected_response == response
  end
end
