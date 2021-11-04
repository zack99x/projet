defmodule ProjectTimeManagerWeb.WorkingTimeController do
  use ProjectTimeManagerWeb, :controller

  alias ProjectTimeManager.Management
  alias ProjectTimeManager.Management.WorkingTime

  action_fallback(ProjectTimeManagerWeb.FallbackController)

  def index(conn, _params) do
    working_times = Management.list_working_times()
    render(conn, "index.json", working_times: working_times)
  end

  # def create(conn, %{"working_time" => working_time_params}) do
  #   with {:ok, %WorkingTime{} = working_time} <-
  #          Management.create_working_time(working_time_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
  #     |> render("show.json", working_time: working_time)
  #   end
  # end


  def create(conn, %{"user_id" => user_id}) do
    payload = Map.merge(%{"user_id" => user_id}, conn.body_params["working_time"])
    with {:ok, %WorkingTime{} = working_time} <- Management.create_working_time(payload) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

  ### get working time by user id and start & end time
  def show(conn, %{"user_id" => user_id, "start" => starttime, "end" => endtime}) do
    working_times = Management.get_wt_by_user_start_end(user_id, starttime, endtime)
    render(conn, "index.json", working_times: working_times)
  end

  ### get working time by user id and working time id
  def show(conn, %{"user_id" => user_id, "id" => id}) do
    working_times = Management.get_wt_by_user_wt(user_id, id)
    render(conn, "index.json", working_times: working_times)
  end

  ### get working time by user id
  def show(conn, %{"user_id" => user_id}) do
    working_times = Management.get_wt_by_user(user_id)
    render(conn, "index.json", working_times: working_times)
  end

  ### get wk by id
  def show(conn, %{"id" => id}) do
    working_time = Management.get_working_time!(id)
    render(conn, "show.json", working_time: working_time)
  end



  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = Management.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <-
           Management.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = Management.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- Management.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
