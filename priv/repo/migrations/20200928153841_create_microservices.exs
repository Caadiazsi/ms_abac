defmodule MsAbac.Repo.Migrations.CreateMicroservices do
  use Ecto.Migration

  def change do

    execute "
      CREATE TABLE IF NOT EXISTS microservices(
        ms_uuid         uuid          NOT NULL,
        ms_name         varchar(20)   NOT NULL,
        ms_description  varchar(300)  NOT NULL,

        inserted_at       timestamp with time zone NOT NULL,
        updated_at        timestamp with time zone NOT NULL,

        PRIMARY KEY(ms_uuid, ms_name, inserted_at)
      )
    ", "DROP TABLE IF EXISTS microservices CASCADE"

    execute"
      ALTER TABLE microservices
        OWNER to postgres;
    "

    execute "
      CREATE UNIQUE INDEX ms_uuid
        ON microservices USING btree
          (ms_uuid, ms_name, inserted_at)
    "
  end
end
