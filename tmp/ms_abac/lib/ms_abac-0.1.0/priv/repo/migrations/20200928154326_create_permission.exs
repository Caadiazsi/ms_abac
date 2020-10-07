defmodule MsAbac.Repo.Migrations.CreatePermission do
  use Ecto.Migration

  def change do
    execute "
      CREATE TABLE IF NOT EXISTS permissions(
        permission_uuid       uuid    NOT NULL,
        role_uuid             uuid    NOT NULL,
        request_uuid          uuid    NOT NULL,

        inserted_at       timestamp with time zone NOT NULL,
        updated_at        timestamp with time zone NOT NULL,
        PRIMARY KEY (permission_uuid, role_uuid, request_uuid)
      )
    ", "DROP TABLE IF EXISTS permissions CASCADE"

    execute "
      ALTER TABLE permissions
        OWNER to postgres;
    "

    execute "
      CREATE UNIQUE INDEX permission_uuid
        ON permissions USING btree
          (permission_uuid, role_uuid, request_uuid)
    "
  end
end
