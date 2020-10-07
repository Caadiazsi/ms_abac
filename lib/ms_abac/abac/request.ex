defmodule MsAbac.Abac.Request do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:request_uuid, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime]
  @derive {Phoenix.Param, key: :request_uuid}

  schema "requests" do
    field :request_name,          :string
    field :request_description,   :string
    field :request_type,          :string
    field :ms_uuid,               Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:ms_uuid, :request_type, :request_description])
    |> validate_required([:ms_uuid, :request_type, :request_description])
  end
end
