defmodule MsAbacWeb.Router do
  use MsAbacWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MsAbacWeb do
    pipe_through :api
    resources "/roles", RoleController, except: [:new, :edit]
    resources "/microservices", MicroserviceController, except: [:new, :edit]
    resources "/requests", RequestController, except: [:new, :edit]
    resources "/permissions", PermissionsController, except: [:new, :edit]
    get "/has_permission/:role_uuid/:request_uuid", PermissionsController, :has_permission
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
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: MsAbacWeb.Telemetry
    end
  end
end
