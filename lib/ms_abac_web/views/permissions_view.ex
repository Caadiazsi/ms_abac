defmodule MsAbacWeb.PermissionsView do
  use MsAbacWeb, :view
  alias MsAbacWeb.PermissionsView

  def render("index.json", %{permission: permission}) do
    render_many(permission |> Enum.map(fn x -> Map.from_struct(x) end), PermissionsView, "permissions.json")
  end

  def render("show.json", %{permissions: permissions}) do
    render_one(permissions, PermissionsView, "permissions.json")
  end

  def render("permissions.json", %{permissions: permissions}) do
    %{permission_uuid: permissions.permission_uuid,
      role_uuid: permissions.role_uuid,
      request_uuid: permissions.request_uuid}
  end
end
