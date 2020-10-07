defmodule MsAbacWeb.PermissionsController do
  use MsAbacWeb, :controller

  alias MsAbac.Abac
  alias MsAbac.Abac.Permissions

  action_fallback MsAbacWeb.FallbackController

  def index(conn, _params) do
    permission = Abac.list_permission()
    render(conn, "index.json", permission: permission)
  end

  def create(conn, %{"permissions" => permissions_params}) do
    with {:ok, %Permissions{} = permissions} <- Abac.create_permissions(permissions_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.permissions_path(conn, :show, permissions))
      |> render("show.json", permissions: permissions)
    end
  end

  def show(conn, %{"id" => id}) do
    permissions = Abac.get_permissions!(id)
    render(conn, "show.json", permissions: permissions)
  end

  def update(conn, %{"id" => id, "permissions" => permissions_params}) do
    permissions = Abac.get_permissions!(id)

    with {:ok, %Permissions{} = permissions} <- Abac.update_permissions(permissions, permissions_params) do
      render(conn, "show.json", permissions: permissions)
    end
  end

  def delete(conn, %{"id" => id}) do
    permissions = Abac.get_permissions!(id)

    with {:ok, %Permissions{}} <- Abac.delete_permissions(permissions) do
      send_resp(conn, :no_content, "")
    end
  end
end
