defmodule MsAbacWeb.RoleView do
  use MsAbacWeb, :view
  alias MsAbacWeb.RoleView

  def render("index.json", %{roles: roles}) do
    render_many(roles |> Enum.map(fn x -> Map.from_struct(x) end), RoleView, "role.json")
  end

  def render("show.json", %{role: role}) do
    render_one(role, RoleView, "role.json")
  end

  def render("role.json", %{role: role}) do
    %{role_uuid: role.role_uuid,
      role_name: role.role_name,
      role_description: role.role_description}
  end
end
