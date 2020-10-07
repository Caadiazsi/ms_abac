defmodule MsAbac.Abac.Permissions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:permission_uuid, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime]
  @derive {Phoenix.Param, key: :permission_uuid}

  schema "permissions" do
    field :request_uuid,  Ecto.UUID
    field :role_uuid,     Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(permissions, attrs) do
    permissions
    |> cast(attrs, [:role_uuid, :request_uuid])
    |> validate_required([:role_uuid, :request_uuid])
  end
end
