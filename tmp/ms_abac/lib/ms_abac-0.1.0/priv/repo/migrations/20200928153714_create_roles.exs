defmodule MsAbac.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    execute "
      CREATE TABLE IF NOT EXISTS roles(
        role_uuid         uuid          NOT NULL,
        role_name         varchar(20)   NOT NULL,
        role_description  varchar(300)  NOT NULL,

        inserted_at       timestamp with time zone NOT NULL,
        updated_at        timestamp with time zone NOT NULL,
        PRIMARY KEY(role_uuid, role_name, inserted_at)
      )
    ", "DROP TABLE IF EXISTS roles CASCADE"

    execute "
      ALTER TABLE roles
        OWNER to postgres;
    "

    execute "
      CREATE UNIQUE INDEX role_uuid
        ON roles USING btree
          (role_uuid, role_name, inserted_at)
    "
  end
end
