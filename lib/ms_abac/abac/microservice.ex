defmodule MsAbac.Abac.Microservice do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:ms_uuid, Ecto.UUID, autogenerate: true}
  @timestamps_opts [type: :utc_datetime]
  @derive {Phoenix.Param, key: :ms_uuid}

  schema "microservices" do
    field :ms_description,  :string
    field :ms_name,         :string

    timestamps()
  end

  @doc false
  def changeset(microservice, attrs) do
    microservice
    |> cast(attrs, [:ms_name, :ms_description])
    |> validate_required([:ms_name, :ms_description])
    |> unique_constraint(:ms_name)
  end
end
