defmodule ProjectTimeManagerWeb.ClockController do
  use ProjectTimeManagerWeb, :controller

  alias ProjectTimeManager.Management
  alias ProjectTimeManager.Management.Clock

  action_fallback(ProjectTimeManagerWeb.FallbackController)

  def index(conn, _params) do
    clocks = Management.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  ### Insert Clock by User ID
  def create(conn, %{"user_id" => user_id}) do
    payload = Map.merge(%{"user_id" => user_id}, conn.body_params["clock"])

    with {:ok, %Clock{} = clock} <- Management.create_clock(payload) do
      conn
      |> put_status(:created)
      |> render("show.json", clock: clock)
    end
  end

  # def create(conn, %{"clock" => clock_params}) do
  #   with {:ok, %Clock{} = clock} <- Management.create_clock(clock_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
  #     |> render("show.json", clock: clock)
  #   end
  # end

  ### Get Clock by UserId
  def show(conn, %{"user_id" => user_id}) do
    clocks = Management.get_clock_by_user(user_id)
    render(conn, "index.json", clocks: clocks)
  end

  def show(conn, %{"id" => id}) do
    clock = Management.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Management.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Management.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Management.get_clock!(id)

    with {:ok, %Clock{}} <- Management.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
