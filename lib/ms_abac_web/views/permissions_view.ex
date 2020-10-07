defmodule MsAbacWeb.PermissionsView do
  use MsAbacWeb, :view
  alias MsAbacWeb.PermissionsView

  def render("index.json", %{permission: permission}) do
    %{data: render_many(permission, PermissionsView, "permissions.json")}
  end

  def render("show.json", %{permissions: permissions}) do
    %{data: render_one(permissions, PermissionsView, "permissions.json")}
  end

  def render("permissions.json", %{permissions: permissions}) do
    %{permission_uuid: permissions.permission_uuid,
      role_uuid: permissions.role_uuid,
      request_uuid: permissions.request_uuid}
  end
end
