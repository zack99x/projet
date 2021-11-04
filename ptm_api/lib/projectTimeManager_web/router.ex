defmodule ProjectTimeManagerWeb.Router do
  use ProjectTimeManagerWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {ProjectTimeManagerWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # scope "/", ProjectTimeManagerWeb do
  #  pipe_through :browser

  #    get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api", ProjectTimeManagerWeb do
    pipe_through(:api)
    resources("/users", UserController, only: [:index, :show, :create, :update, :delete])
    # resources("/clocks", ClockController, only: [:index, :show, :create, :update, :delete])
    scope "/clocks" do
      get("/:user_id", ClockController, :show)
      post("/:user_id", ClockController, :create)
    end

    scope "/working_times" do
      #get("/", WorkingTimeController, :index)
      get("/:user_id/", WorkingTimeController, :show)
      get("/:user_id/:id", WorkingTimeController, :show)
      post("/:user_id", WorkingTimeController, :create)
      put("/:id", WorkingTimeController, :update)
      delete("/:id", WorkingTimeController, :delete)
    end


    # get "/working_times/", WorkingTimeController, :index
    # get "/working_times/:user_id", WorkingTimeController, :show
    # get "/working_times/:user_id/:id", WorkingTimeController, :show
    # post "/working_times/:user_id", WorkingTimeController, :create


    #   resources("/working_times", WorkingTimeController, only: [:index, :show, :create, :update, :delete])
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: ProjectTimeManagerWeb.Telemetry)
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through(:browser)

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
