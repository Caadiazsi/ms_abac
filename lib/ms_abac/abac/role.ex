defmodule MsAbac.Abac.Role do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:role_uuid, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime]
  @derive {Phoenix.Param, key: :role_uuid}

  schema "roles" do
    field :role_name, :string
    field :role_description, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:role_name, :role_description])
    |> validate_required([:role_name, :role_description])
    |> unique_constraint(:role_name)
  end
end
