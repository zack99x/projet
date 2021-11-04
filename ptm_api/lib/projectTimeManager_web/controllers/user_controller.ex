defmodule ProjectTimeManagerWeb.UserController do
  use ProjectTimeManagerWeb, :controller

  alias ProjectTimeManager.Management
  alias ProjectTimeManager.Management.User

  action_fallback(ProjectTimeManagerWeb.FallbackController)

  ### Get user by email & username ?=
  def index(conn, %{"email" => email, "username" => username}) do
    users = Management.getuser_by(email, username)
    render(conn, "index.json", users: users)
  end

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Management.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end


  # def show(conn, %{"email" => email, "username" => username}) do
  #   users = Management.getuser_by(email, username)
  #   render(conn, "show.json", users: users)
  # end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Management.get_user!(id)

    with {:ok, %User{} = user} <- Management.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Management.get_user!(id)

    with {:ok, %User{}} <- Management.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
