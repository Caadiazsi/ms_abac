defmodule MsAbac.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do

    execute "
      CREATE TABLE IF NOT EXISTS requests(
        request_uuid          uuid          NOT NULL,
        ms_uuid               uuid          NOT NULL,
        request_type          varchar(1)    NOT NULL,
        request_description   varchar(300)  NOT NULL,

        inserted_at       timestamp with time zone NOT NULL,
        updated_at        timestamp with time zone NOT NULL,
        PRIMARY KEY(request_uuid, ms_uuid, inserted_at)
      )
    ", "DROP TABLE IF EXISTS requests CASCADE"

    execute "
      ALTER TABLE requests
          OWNER to postgres;
    "

    execute "
      CREATE UNIQUE INDEX request_uuid
        ON requests USING btree
          (request_uuid, ms_uuid, inserted_at)
    "
  end
end
