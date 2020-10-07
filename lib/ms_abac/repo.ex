defmodule MsAbac.Repo do
  use Ecto.Repo,
    otp_app: :ms_abac,
    adapter: Ecto.Adapters.Postgres
end
